package org.example.converter;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ConverterServlet extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

    @EJB
    TemperatureConverter converter;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        request.setAttribute("result", null);
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double value = Double.parseDouble(request.getParameter("srcValue"));
        TemperatureMeasureUnit srcUnit = converter.getMeasureUnit(request.getParameter("srcUnit"));
        TemperatureMeasureUnit resUnit = converter.getMeasureUnit(request.getParameter("resUnit"));
        double result = converter.convert(value, srcUnit, resUnit);

        response.setContentType(CONTENT_TYPE);
        request.setAttribute("result", String.valueOf(result));
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
