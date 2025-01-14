<!DOCTYPE html>
<html>
<head>
    <title>HabitatHaven</title>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f6d365, #fda085);
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            text-align: center;
            color: #ff7f50; /* Оранжевый */
            margin: 20px 0;
        }

        h4 {
            color: #ff944d; /* Оранжевый */
            text-align: center;
            margin-bottom: 20px;
            margin-top: 80px; /* Добавляем отступ сверху, чтобы избежать перекрытия */

        }

        .flats {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin: 0 auto;
        }

        .flat {
            flex: 0 0 calc(20% - 20px); /* 5 items per row on larger screens */
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            margin-bottom: 20px;
            cursor: pointer;
        }

        .flat:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .flat a {
            display: block;
            margin-top: 15px;
            color: #ff944d; /* Оранжевый */
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .flat a:hover {
            color: #ff7f50; /* Оранжевый */
        }

        .flat img {
            /* Фиксированный размер изображения */
            width: 100%;
            height: 200px; /* Задайте желаемую высоту */
            object-fit: cover; /* Растягивание изображения */
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        /* Стили для всех форм, кроме формы с классом .logout-form */
        form:not(.logout-form) {
            max-width: 500px;
            margin: 20px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;

        }

        form:not(.logout-form) input[type="text"],
        form:not(.logout-form) input[type="number"],
        form:not(.logout-form) input[type="submit"] {
            width: calc(100% - 24px);
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            transition: border-color 0.3s ease;
        }

        form:not(.logout-form) input[type="text"]:focus,
        form:not(.logout-form) input[type="number"]:focus,
        form:not(.logout-form) input[type="submit"]:focus {
            outline: none;
            border-color: #ff944d; /* Оранжевый */
        }

        form:not(.logout-form) input[type="submit"] {
            background-color: #ff944d; /* Оранжевый */
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        form:not(.logout-form) input[type="submit"]:hover {
            background-color: #ff7f50; /* Оранжевый */
        }

        table {
            width: 100%;
            margin-bottom: 15px;
        }

        table tr td:first-child {
            text-align: right;
            padding-right: 10px;
            font-weight: bold;
        }

        /* Media queries для адаптивности */
        @media screen and (max-width: 1200px) {
            .flat {
                flex: 0 0 calc(25% - 20px); /* 4 items per row */
            }
        }

        @media screen and (max-width: 992px) {
            .flat {
                flex: 0 0 calc(33.33% - 20px); /* 3 items per row */
            }
        }

        @media screen and (max-width: 768px) {
            .flat {
                flex: 0 0 calc(50% - 20px); /* 2 items per row */
            }
        }

        @media screen and (max-width: 480px) {
            .flat {
                flex: 0 0 calc(100% - 20px); /* 1 item per row */
            }
        }

        .upload-area {
            border: 2px dashed #ff944d;
            border-radius: 5px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            cursor: pointer;
            transition: border-color 0.3s ease;
            position: relative;
        }

        .upload-area.active {
            border-color: #ff7f50;
        }

        .uploaded-files {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 10px;
        }

        .uploaded-file {
            display: inline-flex;
            align-items: center;
            padding: 5px;
            background-color: #ff944d;
            color: white;
            border-radius: 5px;
            font-size: 14px;
        }

        .uploaded-file img {
            width: 20px;
            margin-right: 5px;
        }

        .choose-file-btn {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            cursor: pointer;
        }

        .welcome-message {
            text-align: center;
            color: #ff944d;
        }

        .logout-button,
        .login-button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-button {
            background-color: #ff944d;
            color: white;
            text-decoration: none;
            padding: 10px 30px; /* Расширить кнопку */

        }

        .login-button:hover {
            background-color: #ff7f50;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background-color: #fff; /* Фон заголовка */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 100%;
            position: fixed;
            top: 0;
            z-index: 1000;
            height: 60px; /* Задайте желаемую высоту */

        }

        .header h1 {
            margin: 0;
        }

        .user-actions {
            display: flex;
            align-items: center;
        }

        .logout-container {
            margin-right: 20px;
        }

        .logout-form {
            margin: 0;
            display: flex;
            align-items: center;
        }

        .logout-button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            background-color: #ff944d;
            color: white;
            display: inline-block;
        }

        .logout-button:hover {
            background-color: #ff7f50;
        }

        /* Стили для формы поиска по категориям */
        form[name="categoryForm"] {
            max-width: 300px; /* Задайте желаемую ширину */
            margin: 20px auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        form[name="categoryForm"] select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            transition: border-color 0.3s ease;
        }

        form[name="categoryForm"] select:focus {
            outline: none;
            border-color: #ff944d; /* Оранжевый */
        }

        form[name="categoryForm"] input[type="submit"] {
            width: 100%;
            background-color: #ff944d; /* Оранжевый */
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        form[name="categoryForm"] input[type="submit"]:hover {
            background-color: #ff7f50; /* Оранжевый */
        }
    </style>
</head>
<body>
<header class="header">
    <h1>HabitatHaven - Недвижимость везде</h1>
    <div class="user-actions">
        <#if user.email??>
            <h3 class="welcome-message">${user.name}</h3>
            <div class="logout-container">
                <form action="/logout" method="post" class="logout-form">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Выйти" class="logout-button">
                </form>
            </div>
        <#else>
            <a href="/login" class="login-button">Войти</a>
        </#if>
        <#if user.isAdmin()>
            <a href="/admin">Панель администратора</a>
        </#if>
    </div>
</header>
<h4>Недвижимость везде</h4>
<form action="/" method="get">
    Поиск по названию объявления: <input type="text" name="title"/><br>
    <input type="submit" value="Поиск"/>
</form>
<form action="/category" method="get" name="categoryForm">
    <select name="categoryTitle" id="categorySelect">
        <option value="">Выберите категорию</option>
        <#list categories as category>
            <option value="${category.title}">${category.title}</option>
        </#list>
    </select>
    <input type="submit" value="Показать товары">
</form>
<div class="flats">
    <#list flats as flat>
        <div class="flat"
             onclick="location.href='/flat/${flat.id?c}'">
            <#if flat.previewImageId??>
                <img src="/images/${flat.previewImageId}"
                     alt="Preview Image">
            </#if>
            <p>
                <b>${flat.title}</b><br>
                Цена: ${flat.price}<br>
                <a href="/flat/${flat.id?c}">Подробнее...</a>
            </p>
        </div>
    </#list>
</div>

</div>
<#if user.email??>
    <form action="/flat/create" method="post" enctype="multipart/form-data"
          id="addProductForm" onsubmit="return validateForm()">
        <table>
            <tr>
                <td>Название объявления:</td>
                <td><input type="text" name="title" required></td>
            </tr>
            <tr>
                <td>Описание объявления:</td>
                <td><input type="text" name="description" required></td>
            </tr>
            <tr>
                <td>Цена:</td>
                <td><input type="text" name="price" pattern="[0-9]+"
                           title="Цена должна быть числом" required></td>
            </tr>
            <tr>
                <td>Город:</td>
                <td><input type="text" name="city" required></td>
            </tr>
            <tr>
                <td>Выберите категорию:</td>
                <td>
                    <select name="categoryId" required>
                        <option value="">Выберите категорию</option>
                        <#list categories as category>
                            <option value="${category.id}">${category.title}</option>
                        </#list>
                    </select>
                </td>
            </tr>
        </table>
        <!-- Область для загрузки файлов -->
        <div class="upload-area" id="dragAndDrop">
            <header>Перетащите файлы сюда или щелкните для выбора</header>
            <i class="icon">📁</i>
            <!-- Кнопка для выбора файлов -->
            <label for="fileInput" class="choose-file-btn"></label>
            <input type="file" name="files" id="fileInput" multiple required>
            <div class="uploaded-files" id="uploadedFiles"></div>
            <script>
                document.addEventListener("DOMContentLoaded", () => {
                    const uploadArea = document.getElementById('dragAndDrop');
                    ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
                        uploadArea.addEventListener(eventName, preventDefaults, false);
                        document.body.addEventListener(eventName, preventDefaults, false);
                    });

                    function preventDefaults(e) {
                        e.preventDefault();
                        e.stopPropagation();
                    }

                    ['dragenter', 'dragover'].forEach(eventName => {
                        uploadArea.addEventListener(eventName, highlight, false);
                    });

                    ['dragleave', 'drop'].forEach(eventName => {
                        uploadArea.addEventListener(eventName, unhighlight, false);
                    });

                    function highlight(e) {
                        uploadArea.classList.add('highlight');
                    }

                    function unhighlight(e) {
                        uploadArea.classList.remove('highlight');
                    }

                    uploadArea.addEventListener('drop', handleDrop, false);

                    function handleDrop(e) {
                        const files = e.dataTransfer.files;
                        handleFiles(files);
                    }

                    function handleFiles(files) {
                        const fileInput = document.getElementById('fileInput');
                        fileInput.files = files;
                    }

                    const fileInput = document.getElementById('fileInput');
                    const uploadedFilesContainer = document.getElementById('uploadedFiles');

                    fileInput.addEventListener('change', handleFilesSelection);

                    function handleFilesSelection() {
                        const files = fileInput.files;
                        showUploadedFiles(files);
                    }

                    function showUploadedFiles(files) {
                        uploadedFilesContainer.innerHTML = '';

                        for (let i = 0; i < files.length; i++) {
                            const file = files[i];
                            const fileName = file.name;
                            const uploadedFile = document.createElement('div');
                            uploadedFile.classList.add('uploaded-file');
                            uploadedFile.textContent = fileName;

                            uploadedFilesContainer.appendChild(uploadedFile);
                        }
                    }
                });

                function validateForm() {
                    const title = document.getElementsByName('title')[0].value;
                    const description = document.getElementsByName('description')[0].value;
                    const price = document.getElementsByName('price')[0].value;
                    const city = document.getElementsByName('city')[0].value;
                    const categoryId = document.getElementsByName('categoryId')[0].value;
                    const files = document.getElementById('fileInput').files;

                    if (title === '' || description === '' || price === '' || city === '' || categoryId === '' || files.length === 0) {
                        alert('Пожалуйста, заполните все обязательные поля и добавьте хотя бы один файл.');
                        return false;
                    }
                    const priceField = document.getElementsByName('price')[0];
                    const price = priceField.value;

                    // Проверка на пустое поле уже есть в общей валидации,
                    // добавим проверку на соответствие регулярному выражению
                    if (!price.match(/^\d+$/)) {
                        alert('Пожалуйста, введите корректное значение для цены (только цифры).');
                        priceField.focus();
                        return false;
                    }

                    return true;
                }
            </script>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Добавить товар">
        <!-- Вывод сообщения об успехе -->
    </form>

</#if>
</body>
</html>
