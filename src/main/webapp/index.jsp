<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Конвертер</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<body>
<jsp:include page="header.jsp"/>
<main class="container">
    <form action="/convert" method="post" class="w-100">
        <div class="card m-5">
            <div class="card-header bg-secondary">
                <h5 class="card-title text-white">Конвертер температуры</h5>
            </div>
            <div class="card-body">
                <% String result = (String) request.getAttribute("result"); %>
                <c:if test="<%=result != null%>">
                    <div class="alert alert-primary" role="alert">
                        Результат: <%=result%>
                    </div>
                </c:if>
                <div class="form-row">
                    <div class="col-md-4">
                        <label for="srcValue">Значение температуры
                            <input type="number" id="srcValue" name="srcValue" class="form-control"
                                   placeholder="Значение" required>
                        </label>
                    </div>
                    <div class="col-md-4">
                        <label for="srcUnit">Исходные единицы
                            <select name="srcUnit" id="srcUnit" class="form-control" required>
                                <option value="CELSIUS" selected>Цельсий</option>
                                <option value="KELVIN">Кельвин</option>
                                <option value="FAHRENHEIT">Фаренгейт</option>
                            </select>
                        </label>
                    </div>
                    <div class="col-md-4">
                        <label for="srcUnit">Конечные единицы
                            <select name="resUnit" id="resUnit" class="form-control" required>
                                <option value="CELSIUS" selected>Цельсий</option>
                                <option value="KELVIN">Кельвин</option>
                                <option value="FAHRENHEIT">Фаренгейт</option>
                            </select>
                        </label>
                    </div>
                </div>
            </div>
            <div class="card-footer bg-light">
                <button class="btn btn-primary" type="submit">Перевести</button>
            </div>
        </div>
    </form>
</main>
<jsp:include page="footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
</body>
</html>
