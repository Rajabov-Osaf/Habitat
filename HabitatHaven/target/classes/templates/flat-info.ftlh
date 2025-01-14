<!DOCTYPE html>
<html>
<head>
    <title>HabitatHaven - Детали недвижимости</title>
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
            max-width: 800px;
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

        .flat-images {
            display: flex;
            margin-bottom: 20px;
            padding-bottom: 20px;
            overflow-x: hidden;
            justify-content: center;
        }

        .flat-images img {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border-radius: 5px;
            margin-right: 10px;
            transition: transform 0.3s ease;
            cursor: pointer;
        }

        .flat-images img:hover {
            transform: scale(1.2);
        }

        .flat-details p {
            margin: 10px 0;
        }

        .delete-form {
            margin-top: 30px;
        }

        .delete-form input[type="submit"] {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #e74c3c;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .delete-form input[type="submit"]:hover {
            background-color: #c0392b;
        }

        .flat-images-container {
            position: relative;
        }

        .prev,
        .next {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: rgba(255, 255, 255, 0.7);
            padding: 10px;
            border-radius: 50%;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: none;
        }

        .prev {
            left: 10px;
        }

        .next {
            right: 10px;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
        }

        .modal-content {
            margin: auto;
            display: block;
            max-width: 90%;
            max-height: 90%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .close {
            color: #fff;
            position: absolute;
            top: 10px;
            right: 20px;
            font-size: 30px;
            font-weight: bold;
            cursor: pointer;
        }

        .description-box {
            border: 1px solid #ccc;
            padding: 8px;
            border-radius: 5px;
            background-color: #f9f9f9;
            min-height: 100px; /* Минимальная высота поля */
            font-family: Arial, sans-serif;
            color: #333;
            line-height: 1.5;
            word-wrap: break-word; /* Перенос слов при необходимости */
        }
    </style>
</head>
<body>
<div class="container">
    <h1>HabitatHaven</h1>
    <h4>Подробная информация о недвижимости</h4>
    <div class="flat-images-container">
        <div class="flat-images">
            <#list images as img>
                <img src="/images/${img.id}" alt="Product Image">
            </#list>
        </div>
        <div class=" prev">
            ◀
        </div>
        <div class="next">
            ▶
        </div>
    </div>
    <div class="flat-details">
        <p><b>Название объявления:</b> ${flat.title}</p>
        <div class="description-box">
            ${flat.description}
        </div>
        <p><b>Цена:</b> ${flat.price}</p>
        <p><b>Город:</b> ${flat.city}</p>
        <p><b>Автор:</b> <a
                    href="/user/${flat.user.id}">${flat.user.name}</a></p>
        <p><b>Номер телефона:</b> ${flat.user.phoneNumber}</p>
    </div>
    <div class="modal" id="modal">
        <span class="close" id="close">&times;</span>
        <img class="modal-content" id="modalImage" src="" alt="Modal Image">
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const productImages = document.querySelector('.flat-images');
        const prevButton = document.querySelector('.prev');
        const nextButton = document.querySelector('.next');

        if (document.querySelectorAll('.flat-images img').length > 3) {
            prevButton.style.display = 'block';
            nextButton.style.display = 'block';
        } else {
            productImages.style.justifyContent = 'center';
        }

        prevButton.addEventListener('click', () => {
            productImages.scrollBy({
                left: -150,
                behavior: 'smooth'
            });
        });

        nextButton.addEventListener('click', () => {
            productImages.scrollBy({
                left: 150,
                behavior: 'smooth'
            });
        });
    });
    const images = document.querySelectorAll('.flat-images img');
    const modal = document.getElementById('modal');
    const modalImg = document.getElementById('modalImage');
    const closeModal = document.getElementById('close');

    images.forEach(img => {
        img.addEventListener('click', () => {
            modal.style.display = 'block';
            modalImg.src = img.src;
        });
    });

    closeModal.addEventListener('click', () => {
        modal.style.display = 'none';
    });

    modal.addEventListener('click', (event) => {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });
</script>
</body>
</html>
