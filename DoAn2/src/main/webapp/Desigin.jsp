<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>FASHION STORE</title>
    <link rel="icon" href="./DoAnFile/img/icon/main_logo.png">
    <link
      href="https://fonts.googleapis.com/css?family=Quicksand:400,600,700&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600&display=swap"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="./DoAnFile/ThietKeAo/icomoon/style.css" />
    <link
      rel="stylesheet"
      href="./DoAnFile/ThietKeAo/css/owl.carousel.min.css"
    />
    <link rel="stylesheet" href="./DoAnFile/ThietKeAo/css/style.css" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./DoAnFile/ThietKeAo/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./DoAnFile/css/reset.css" />
    <link rel="stylesheet" href="./DoAnFile/ThietKeAo/main.css" />
    <link
      rel="stylesheet"
      href="./DoAnFile/assets/font/themify-icons-font/themify-icons/themify-icons.css"
    />
    <style>
      .text-design {
        position: absolute;
        top: 13%;
        left: 44%;
      }

      .main__designer {
        justify-content: center;
      }
      .VI {
        display: none;
      }
      .button_add{
        width: 100%;
        background: #007bff;
        color: #fff!important;
        text-transform: uppercase;
        font-size: .8rem;
        padding: 15px 20px!important;
        line-height: 1;
        font-weight: 700;
      }
      #ds_text{
        display: none;
      }

    </style>
  </head>
  <body>
    <header role="banner">
      <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <div class="container">
          <a href="./index.jsp" class="logo__fashion" href="">FASHION STORE</a>
          <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarsExample05"
            aria-controls="navbarsExample05"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarsExample05">
            <ul class="navbar-nav ml-auto pl-lg-5 pl-0">
              <li class="nav-item">
                <a class="nav-link EN" href="#">DESIGN T-Shirt</a>
                <a class="nav-link VI" href="#">THIẾT KẾ ÁO</a>
              </li>
              <li class="nav-item dropdown">
                <a
                  class="nav-link dropdown-toggle EN"
                  href="#"
                  id="dropdown04"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                  >Services</a
                >
                <a
                  class="nav-link dropdown-toggle VI"
                  href="#"
                  id="dropdown05"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                  >DỊCH VỤ</a
                >
                <div class="dropdown-menu EN" aria-labelledby="dropdown04">
                  <a class="dropdown-item" href="#">Support Design</a>
                  <a class="dropdown-item" href="#">Contact Fashion Designer</a>
                  <a class="dropdown-item" href="#">Watching Clothes</a>
                </div>
                <div class="dropdown-menu VI" aria-labelledby="dropdown04">
                  <a class="dropdown-item" href="#">Hỗ trợ thiết kế</a>
                  <a class="dropdown-item" href="#">Liên hệ với nhà thiết kế</a>
                  <a class="dropdown-item" href="#">Xem sản phẩm</a>
                </div>
              </li>
              <li class="nav-item">
                <a class="nav-link EN" href="#">About</a>
              </li>
              <li class="nav-item">
                <a class="nav-link VI" href="#">Về chúng tôi</a>
              </li>
              <li class="nav-item"><a class="nav-link EN" href="#">News</a></li>
              <li class="nav-item">
                <a class="nav-link VI" href="#">Tin tức</a>
              </li>
            </ul>

            <ul class="navbar-nav ml-auto">
              <li class="nav-item cta-btn">
                <a class="nav-link" href="#">Contact Us</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>
    <div class="main__designer">
      <div id="tshirt-div">
        <img
          id="tshirt-backgroundpicture"
          src="./DoAnFile/ThietKeAo/background_tshirt1.png"
        />
        <div class="text-design"></div>
        <div id="drawingArea" class="drawing-area">
          <div class="canvas-container">
            <canvas id="tshirt-canvas" width="200" height="400"></canvas>
          </div>
        </div>
      </div>
      <div class="main__img-object">
        <div class="ckeditor__input-app">
          <div id="ckeditor__input"></div>
          <button id="submit">Send</button>
        </div>
      </div>
      <form action="DesignServlet" method="post" enctype="multipart/form-data">
          
      <div class="main__editor">
        <div class="main__editor-item">
          <label for="tshirt-color"
            ><span class="main__editor-span">Background </span></label
          >
          <input type="color" id="tshirt-color" name="ds_color" value="#FFFFFF" />
        </div>
        <div class="main__editor-item">
          <label for="tshirt-design"
            ><span class="main__editor-span">Logo</span></label
          >
          <select id="tshirt-design" name="ds_logo">
            <option value="">Our designs</option>
            <option value="./DoAnFile/ThietKeAo/logo.png">Batman</option>
            <option value="./DoAnFile/ThietKeAo/Picture2.png">Nike</option>
            <option value="./DoAnFile/ThietKeAo/Picture1.png">Nike1</option>
            <option value="./DoAnFile/ThietKeAo/Img/VKU.png">VKU</option>
          </select>
        </div>
        <div class="main__editor-item main__editor-item-add">
          <div class="main__editor-item-add-text">
            <i class="ti-text"></i> <span>Add text</span>
            <input type="text" id="ds_text" name="ds_text"/>
          </div>
        </div>
        <div class="main__editor-item main__editor-item-add upload__add">
          <label for="tshirt-custompicture"
            ><span class="main__editor-span">Upload File</span></label
          >
          <input type="file" id="tshirt-custompicture" name="uploadFile" value="" />
        </div>
        <div class="btn_send">
            <button class="button_add" type="submit">ADD</button>
        </div>
      </div>
      </form>
    </div>
    <script src="./DoAnFile/ThietKeAo/fabric.js-4.5.0/fabric.js-4.5.0/dist/fabric.min.js"></script>
    <script src="./DoAnFile/ThietKeAo/js/jquery-3.3.1.min.js"></script>
    <script src="./DoAnFile/ThietKeAo/js/popper.min.js"></script>
    <script src="./DoAnFile/ThietKeAo/js/bootstrap.min.js"></script>
    <script src="./DoAnFile/ThietKeAo/js/jquery.sticky.js"></script>
    <script src="./DoAnFile/ThietKeAo/js/main.js"></script>
    <script src="./DoAnFile/CKEditor/ckeditor5-build-classic-27.1.0/ckeditor5-build-classic/ckeditor.js"></script>
    <script>
      let editor;
      ClassicEditor.create(document.querySelector("#ckeditor__input"))
        .then((newEditor) => {
          editor = newEditor;
        })
        .catch((error) => {
          console.error(error);
        });

      document.querySelector("#submit").addEventListener("click", () => {
        let editorData = editor.getData();
        const textDesign = document.querySelector(".text-design");
        const as = document.querySelector('#ds_text');
        textDesign.innerHTML = editorData;
        as.value = editor.getData();
        console.log(editor.getData());
        console.log(as.value);
      });
      var addText = document.querySelector(".main__editor-item-add-text");
      var mainEditor = document.querySelector(".ckeditor__input-app");

      var countAddText = 0;
      addText.onclick = function () {
        countAddText++;

        if (countAddText % 2 !== 0) {
          mainEditor.style.display = "flex";
        } else {
          mainEditor.style.display = "none";
        }
      };
      let canvas = new fabric.Canvas("tshirt-canvas");

      function updateTshirtImage(imageURL) {
        fabric.Image.fromURL(imageURL, function (img) {
          img.scaleToHeight(300);
          img.scaleToWidth(300);
          canvas.centerObject(img);
          canvas.add(img);
          canvas.renderAll()
        })
      }
      document.getElementById("tshirt-color").addEventListener("input", function () {
        document.getElementById("tshirt-div").style.backgroundColor = this.value
      }, !1);
      document.getElementById("tshirt-design").addEventListener("change", function () {
        updateTshirtImage(this.value)
      }, !1);
      document.getElementById("tshirt-custompicture").addEventListener("change", function (e) {
        var reader = new FileReader();
        reader.onload = function (event) {
          var imgObj = new Image();
          imgObj.src = event.target.result;
          imgObj.onload = function () {
            var img = new fabric.Image(imgObj);
            img.scaleToHeight(300);
            img.scaleToWidth(300);
            canvas.centerObject(img);
            canvas.add(img);
            canvas.renderAll()
          }
        };
        if (e.target.files[0]) {
          reader.readAsDataURL(e.target.files[0])
        }
      }, !1);
      document.addEventListener("keydown", function (e) {
        var keyCode = e.keyCode;
        if (keyCode == 46) {
          console.log("Removing selected element on Fabric.js on DELETE key !");
          canvas.remove(canvas.getActiveObject())
        }
      }, !1);
    </script>
  </body>
</html>
