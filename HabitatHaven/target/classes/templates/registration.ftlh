<!DOCTYPE html>
<html>
<head>
    <title>HabitatHaven</title>
    <style>
        .container {
            max-width: 400px;
            width: 90%;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            box-sizing: border-box;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 20px;
        }

        h4 {
            color: #2980b9;
            margin-bottom: 30px;
        }

        form {
            margin-top: 20px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #2980b9;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #2471a3;
        }

        h2 {
            color: red;
        }

        a {
            text-decoration: none;
            color: #2980b9;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>HabitatHaven</h1>
    <hr>
    <h4>Регистрация</h4>
    <form action="/registration" method="post" onsubmit="return validateRegistrationForm()" name="registrationForm">
        Имя пользователя: <input type="text" name="name"><br><br>
        Эл. почта: <input type="email" name="email"><br><br>
        Номер телефона: <input type="text" name="phoneNumber"><br><br>
        Пароль: <input type="password" name="password"><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Зарегистрироваться"/>
    </form>
    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>
</div>
</body>
<script>
    function validateRegistrationForm() {
        const email = document.forms["registrationForm"]["email"].value;
        const phoneNumber = document.forms["registrationForm"]["phoneNumber"].value;
        const password = document.forms["registrationForm"]["password"].value;

        // Basic email validation
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            alert("Введите валидный email адрес");
            return false;
        }

        // Phone number validation (Example: digits-only check)
        const phoneNumberRegex = /^\d+$/;
        if (!phoneNumberRegex.test(phoneNumber)) {
            alert("Введите валидный номер телефона (только цифры)");
            return false;
        }

        // Password length check
        if (password.length < 6) {
            alert("Длина пароля должна быть не менее 6-ти символов");
            return false;
        }

        return true; // Form submission allowed
    }
</script>
</html>
