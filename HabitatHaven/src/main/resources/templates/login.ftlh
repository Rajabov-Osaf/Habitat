<!DOCTYPE html>
<html>
<head>
    <title>HabitatHaven</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f9f9f9;
            color: #333;
        }

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

        a {
            text-decoration: none;
            color: #2980b9;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>HAbitatHaven</h1>
    <hr>
    <h4>Авторизация</h4>
    <form action="/login" method="post" onsubmit="return validateLoginForm()" name="loginForm">
        Эл. почта: <input type="email" name="username"><br><br>
        Пароль: <input type="password" name="password"><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Вход"/>
    </form>
    <a href="/registration">Зарегистрироваться</a>
</div>
</body>
<script>
    function validateLoginForm() {
        const email = document.forms["loginForm"]["username"].value;
        const password = document.forms["loginForm"]["password"].value;

        // Basic email validation
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            alert("Введите валидный email адрес");
            return false;
        }

        // Password length check
        if (password.length < 6) {
            alert("Пароль должен быть не менее 6-ти символов");
            return false;
        }

        return true;
    }
</script>
</html>

