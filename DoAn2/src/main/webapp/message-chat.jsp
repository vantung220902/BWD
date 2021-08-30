<%-- 
    Document   : message-chat
    Created on : Jun 28, 2021, 9:44:46 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="./DoAnFile/Admin-BWD/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/libs/css/style.css">
    <link rel="stylesheet" href="./DoAnFile/Admin-BWD/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <title>FASHION STORE</title>
    <link rel="icon" href="./DoAnFile/img/icon/main_logo.png">
</head>

<body class="chat-body">
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
       <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
        <jsp:include page="./headerAdmin.jsp"></jsp:include>
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
        <jsp:include page="./navLeft.jsp"></jsp:include>
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="main-container">
                <div class="navbar bg-white breadcrumb-bar border-bottom">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Overview</a>
                            </li>
                            <li class="breadcrumb-item"><a href="pages-app.html">App Pages</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Chat</li>
                        </ol>
                    </nav>
                    <div class="dropdown">
                        <button class="btn btn-outline-light btn-sm" data-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-cog"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#">Manage Members</a>
                            <a class="dropdown-item" href="#">Subscribe</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item text-danger" href="#">Leave Chat</a>
                        </div>
                    </div>
                </div>
                <div class="content-container">
                    <div class="chat-module">
                        <div class="chat-module-top">
                            <form>
                                <div class="input-group input-group-round">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="fas fa-search"></i>
                                        </span>
                                    </div>
                                    <input type="search" class="form-control filter-list-input" placeholder="Search chat" aria-label="Search Chat">
                                </div>
                            </form>
                            <div class="chat-module-body">
                                <div class="media chat-item">
                                    <img alt="William" src="./DoAnFile/Admin-BWD/assets/images/avatar-1.jpg" class="rounded-circle user-avatar-lg">
                                    <div class="media-body">
                                        <div class="chat-item-title">
                                            <span class="chat-item-author">Tùng</span>
                                            <span>4 days ago</span>
                                        </div>
                                        <div class="chat-item-body">
                                            <p>Alo anh em ơi</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="media chat-item">
                                    <img alt="Komal" src="./DoAnFile/Admin-BWD/assets/images/avatar-2.jpg" class="rounded-circle user-avatar-lg">
                                    <div class="media-body">
                                        <div class="chat-item-title">
                                            <span class="chat-item-author">Hậu</span>
                                            <span>4 days ago</span>
                                        </div>
                                        <div class="chat-item-body">
                                            <p>Đây bạn ơi
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="media chat-item">
                                    <img alt="tanu" src="./DoAnFile/Admin-BWD/assets/images/avatar-3.jpg" class="rounded-circle user-avatar-lg">
                                    <div class="media-body">
                                        <div class="chat-item-title">
                                            <span class="chat-item-author">Khánh</span>
                                            <span>3 days ago</span>
                                        </div>
                                        <div class="chat-item-body">
                                            <p>Nghe đây bạn ơi🔥</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="media chat-item">
                                    <img alt="Bhoomi" src="./DoAnFile/Admin-BWD/assets/images/avatar-4.jpg" class="rounded-circle user-avatar-lg">
                                    <div class="media-body">
                                        <div class="chat-item-title">
                                            <span class="chat-item-author">Vũ</span>
                                            <span>3 days ago</span>
                                        </div>
                                        <div class="chat-item-body">
                                            <h1 id="-">😉</h1>
                                        </div>
                                    </div>
                                </div>
                                <div class="media chat-item">
                                    <img alt="William" src="./DoAnFile/Admin-BWD/assets/images/avatar-1.jpg" class="rounded-circle user-avatar-lg">
                                    <div class="media-body">
                                        <div class="chat-item-title">
                                            <span class="chat-item-author">Tùng</span>
                                            <span>2 days ago</span>
                                        </div>
                                        <div class="chat-item-body">
                                            <p>:)))))</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="media chat-item">
                                    <img alt="Daniel" src="./DoAnFile/Admin-BWD/assets/images/avatar-2.jpg" class="rounded-circle user-avatar-lg">
                                    <div class="media-body">
                                        <div class="chat-item-title">
                                            <span class="chat-item-author">Hậu</span>
                                            <span>Yesterday</span>
                                        </div>
                                        <div class="chat-item-body">
                                            <p> 🤓</p>
                                        </div>
                                        <div class="media media-attachment">
                                            <div class="avatar bg-primary">
                                                <i class="fas fa-file"></i>
                                            </div>
                                            <div class="media-body">
                                                <a href="#" class="">BWD.doc</a>
                                                <span>24kb Document</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="media chat-item">
                                    <img alt="Fallon" src="./DoAnFile/Admin-BWD/assets/images/avatar-3.jpg" class="rounded-circle user-avatar-lg">
                                    <div class="media-body">
                                        <div class="chat-item-title">
                                            <span class="chat-item-author">Khánh</span>
                                            <span>2 hours ago</span>
                                        </div>
                                        <div class="chat-item-body">
                                            <p>OK</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="media chat-item">
                                    <img alt="Kimberly" src="./DoAnFile/Admin-BWD/assets/images/avatar-4.jpg" class="rounded-circle user-avatar-lg">
                                    <div class="media-body">
                                        <div class="chat-item-title">
                                            <span class="chat-item-author">Tùng</span>
                                            <span>Just now</span>
                                        </div>
                                        <div class="chat-item-body">
                                            <p> 🤜</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="chat-module-bottom">
                            <form class="chat-form">
                                <textarea class="form-control" placeholder="Type message" rows="1"></textarea>
                                <div class="chat-form-buttons">
                                    <button type="button" class="btn btn-link">
                                        <i class="far fa-smile"></i>
                                    </button>
                                    <div class="custom-file custom-file-naked">
                                        <input type="file" class="custom-file-input" id="customFile">
                                        <label class="custom-file-label" for="customFile">
                                            <i class="fas fa-paperclip"></i>
                                        </label>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="chat-sidebar collapse" id="sidebar-collapse">
                        <div class="chat-sidebar-content">
                            <div class="chat-team-sidebar text-small">
                                <div class="chat-team-sidebar-top">
                                    <div class="media align-items-center">
                                        <a href="#" class="mr-2">
                                            <img alt="Team Avatar" src="./DoAnFile/Admin-BWD/assets/images/avatar-2.jpg" class="rounded-circle user-avatar-xl">
                                        </a>
                                        <div class="media-body">
                                            <h5 class="mb-1">Pipeline Fans</h5>
                                            <p>A collective of Pipeline enthusiasts sharing the the love</p>
                                        </div>
                                    </div>
                                    <ul class="nav nav-tabs nav-justified" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active show" id="members-tab" data-toggle="tab" href="#members" role="tab" aria-controls="members" aria-selected="true">Members</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="files-tab" data-toggle="tab" href="#files" role="tab" aria-controls="files" aria-selected="false">Files</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="chat-team-sidebar-bottom">
                                    <div class="tab-content">
                                        <div class="tab-pane fade active show" id="members" role="tabpanel" aria-labelledby="members-tab" data-filter-list="list-group">
                                            <div id="test-list">
                                                <form class="px-3 mb-3">
                                                    <div class="input-group input-group-round">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">
                                                            <i class="fas fa-search"></i>
                                                        </span>
                                                        </div>
                                                        <input type="text" class="form-control search" placeholder="Filter members" aria-label="Filter Members">
                                                    </div>
                                                </form>
                                                <div class="list-group list-group-flush  list">
                                                    <a class="list-group-item list-group-item-action" href="#">
                                                        <div class="media media-member mb-0">
                                                            <img alt="Claire Connors" src="./DoAnFile/Admin-BWD/assets/images/avatar-1.jpg" class="avatar">
                                                            <div class="media-body ">
                                                                <h6 class="mb-0 name">Claire Connors</h6>
                                                                <span class="name">Administrator</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <a class="list-group-item list-group-item-action" href="#">
                                                        <div class="media media-member mb-0">
                                                            <img alt="Marcus Simmons" src="./DoAnFile/Admin-BWD/assets/images/avatar-2.jpg" class="avatar">
                                                            <div class="media-body">
                                                                <h6 class="mb-0 name">Marcus Simmons</h6>
                                                                <span class="name">Administrator</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <a class="list-group-item list-group-item-action" href="#">
                                                        <div class="media media-member mb-0">
                                                            <img alt="Peggy Brown" src="./DoAnFile/Admin-BWD/assets/images/avatar-3.jpg" class="avatar">
                                                            <div class="media-body">
                                                                <h6 class="mb-0 name">Peggy Brown</h6>
                                                                <span class="name">Project Manager</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <a class="list-group-item list-group-item-action" href="#">
                                                        <div class="media media-member mb-0">
                                                            <img alt="Harry Xai" src="./DoAnFile/Admin-BWD/assets/images/avatar-3.jpg" class="avatar">
                                                            <div class="media-body">
                                                                <h6 class="mb-0 name">Harry Xai</h6>
                                                                <span class="name">Project Manager</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <a class="list-group-item list-group-item-action" href="#">
                                                        <div class="media media-member mb-0">
                                                            <img alt="Sally Harper" src="./DoAnFile/Admin-BWD/assets/images/avatar-1.jpg" class="avatar">
                                                            <div class="media-body">
                                                                <h6 class="mb-0 name">Sally Harper</h6>
                                                                <span class="name">Developer</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <a class="list-group-item list-group-item-action" href="#">
                                                        <div class="media media-member mb-0">
                                                            <img alt="Ravi Singh" src="./DoAnFile/Admin-BWD/assets/images/avatar-2.jpg" class="avatar">
                                                            <div class="media-body">
                                                                <h6 class="mb-0 name">Ravi Singh</h6>
                                                                <span class="name">Developer</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <a class="list-group-item list-group-item-action" href="#">
                                                        <div class="media media-member mb-0">
                                                            <img alt="David Whittaker" src="./DoAnFile/Admin-BWD/assets/images/avatar-3.jpg" class="avatar">
                                                            <div class="media-body">
                                                                <h6 class="mb-0 name">David Whittaker</h6>
                                                                <span class="name">Designer</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <a class="list-group-item list-group-item-action" href="#">
                                                        <div class="media media-member mb-0">
                                                            <img alt="Kerri-Anne Banks" src="./DoAnFile/Admin-BWD/assets/images/avatar-4.jpg"  class="avatar ">
                                                        <div class="media-body ">
                                                            <h6 class="mb-0 name ">Kerri-Anne Banks</h6>
                                                            <span class="name ">Marketing</span>
                                                        </div>
                                                    </div>
                                                </a>
                                                    <a class="list-group-item list-group-item-action " href="# ">
                                                    <div class="media media-member mb-0 ">
                                                        <img alt="Masimba Sibanda " src="./DoAnFile/Admin-BWD/assets/images/avatar-3.jpg" class="avatar">
                                                            <div class="media-body">
                                                                <h6 class="mb-0 name">Masimba Sibanda</h6>
                                                                <span class="name">Designer</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <a class="list-group-item list-group-item-action" href="#">
                                                        <div class="media media-member mb-0">
                                                            <img alt="Krishna Bajaj" src="./DoAnFile/Admin-BWD/assets/images/avatar-2.jpg"  class="avatar ">
                                                        <div class="media-body ">
                                                            <h6 class="mb-0 name ">Krishna Bajaj</h6>
                                                            <span class="name ">Marketing</span>
                                                        </div>
                                                    </div>
                                                </a>
                                                    <a class="list-group-item list-group-item-action " href="# ">
                                                    <div class="media media-member mb-0 ">
                                                        <img alt="Kenny Tran " src="./DoAnFile/Admin-BWD/assets/images/avatar-1.jpg" class="avatar">
                                                            <div class="media-body">
                                                                <h6 class="mb-0 name">Kenny Tran</h6>
                                                                <span class="name">Contributor</span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="files" role="tabpanel" aria-labelledby="files-tab" data-filter-list="dropzone-previews">
                                            <div id="test-list-2">
                                                <form class="px-3 mb-3">
                                                    <div class="input-group input-group-round">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">
                                                            <i class="fas fa-search"></i>
                                                        </span>
                                                        </div>
                                                        <input type="text" class="form-control search" placeholder="Filter members" aria-label="Filter Members">
                                                    </div>
                                                </form>
                                                <ul class="d-none dz-template list-unstyled">
                                                    <li class="list-group-item dz-preview dz-file-preview">
                                                        <div class="media align-items-center dz-details">
                                                            <ul class="avatars list-unstyled">
                                                                <li>
                                                                    <div class="avatar bg-primary dz-file-representation">
                                                                        <img src="https://jituchauhan.com/" class="avatar" data-dz-thumbnail="" alt="">
                                                                        <i class="fas fa-paperclip"></i>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <img alt="David Whittaker" src="./DoAnFile/Admin-BWD/assets/images/avatar-4.jpg" class="avatar" data-title="David Whittaker" data-toggle="tooltip">
                                                                </li>
                                                            </ul>
                                                            <div class="media-body d-flex justify-content-between align-items-center">
                                                                <div class="dz-file-details">
                                                                    <a href="#" class="dz-filename">
                                                                    <span data-dz-name=""></span>
                                                                </a>
                                                                    <br>
                                                                    <span class="text-small dz-size" data-dz-size=""></span>
                                                                </div>
                                                                <img alt="Loader" src="./DoAnFile/Admin-BWD/assets/images/loader.svg" class="dz-loading">
                                                                <div class="dropdown">
                                                                    <button class="btn-options" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="fas fa-ellipsis-v"></i>
                                                                    </button>
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Download</a>
                                                                        <a class="dropdown-item" href="#">Share</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item text-danger" href="#" data-dz-remove="">Delete</a>
                                                                    </div>
                                                                </div>
                                                                <button class="btn btn-danger btn-sm dz-remove" data-dz-remove="">
                                                                    Cancel
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <div class="progress dz-progress">
                                                            <div class="progress-bar dz-upload" data-dz-uploadprogress=""></div>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <form class="dropzone dz-clickable" action="http://mediumra.re/dropzone/upload.php">
                                                    <span class="dz-message">Drop files here or click here to upload</span>
                                                </form>
                                                <ul class="list-group list-group-activity dropzone-previews flex-column-reverse list-group-flush list ">
                                                    <li class="list-group-item" data-t="null" data-i="null" data-l="null" data-e="null">
                                                        <div class="media align-items-center">
                                                            <ul class="avatars list-unstyled">
                                                                <li>
                                                                    <div class="avatar bg-primary">
                                                                        <i class="fas fa-file"></i>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <img alt="Peggy Brown" src="./DoAnFile/Admin-BWD/assets/images/avatar-1.jpg" class="avatar filter-by-data-title" data-title="Peggy Brown" data-toggle="tooltip" data-filter-by="data-title">
                                                                </li>
                                                            </ul>
                                                            <div class="media-body d-flex justify-content-between align-items-center">
                                                                <div>
                                                                    <a href="#" class="name">client-questionnaire</a>
                                                                    <br>
                                                                    <span class="name">48kb Text Doc</span>
                                                                </div>
                                                                <div class="dropdown">
                                                                    <button class="btn-options" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="fas fa-ellipsis-v"></i>
                                                                    </button>
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Download</a>
                                                                        <a class="dropdown-item" href="#">Share</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        <div class="media align-items-center">
                                                            <ul class="avatars list-unstyled">
                                                                <li>
                                                                    <div class="avatar bg-primary">
                                                                        <i class="fas fa-file"></i>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <img alt="Harry Xai" src="./DoAnFile/Admin-BWD/assets/images/avatar-2.jpg" class="avatar filter-by-data-title" data-title="Harry Xai" data-toggle="tooltip" data-filter-by="data-title">
                                                                </li>
                                                            </ul>
                                                            <div class="media-body d-flex justify-content-between align-items-center">
                                                                <div>
                                                                    <a href="#" class="name">moodboard_images</a>
                                                                    <br>
                                                                    <span class="name">748kb ZIP</span>
                                                                </div>
                                                                <div class="dropdown">
                                                                    <button class="btn-options" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="fas fa-ellipsis-v"></i>
                                                                    </button>
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Download</a>
                                                                        <a class="dropdown-item" href="#">Share</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        <div class="media align-items-center">
                                                            <ul class="avatars list-unstyled">
                                                                <li>
                                                                    <div class="avatar bg-primary">
                                                                        <i class="fas fa-image"></i>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <img alt="Ravi Singh" src="./DoAnFile/Admin-BWD/assets/images/avatar-4.jpg" class="avatar filter-by-data-title" data-title="Ravi Singh" data-toggle="tooltip" data-filter-by="data-title">
                                                                </li>
                                                            </ul>
                                                            <div class="media-body d-flex justify-content-between align-items-center">
                                                                <div>
                                                                    <a href="#" class="name">possible-hero-image</a>
                                                                    <br>
                                                                    <span class="name">1.2mb JPEG image</span>
                                                                </div>
                                                                <div class="dropdown">
                                                                    <button class="btn-options" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="fas fa-ellipsis-v"></i>
                                                                    </button>
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Download</a>
                                                                        <a class="dropdown-item" href="#">Share</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        <div class="media align-items-center">
                                                            <ul class="avatars list-unstyled">
                                                                <li>
                                                                    <div class="avatar bg-primary">
                                                                        <i class="fas fa-file"></i>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <img alt="Claire Connors" src="./DoAnFile/Admin-BWD/assets/images/avatar-3.jpg" class="avatar filter-by-data-title" data-title="Claire Connors" data-toggle="tooltip" data-filter-by="data-title">
                                                                </li>
                                                            </ul>
                                                            <div class="media-body d-flex justify-content-between align-items-center">
                                                                <div>
                                                                    <a href="#" class="name">LandingPrototypes</a>
                                                                    <br>
                                                                    <span class="name">415kb Sketch Doc</span>
                                                                </div>
                                                                <div class="dropdown">
                                                                    <button class="btn-options" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="fas fa-ellipsis-v"></i>
                                                                    </button>
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Download</a>
                                                                        <a class="dropdown-item" href="#">Share</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        <div class="media align-items-center">
                                                            <ul class="avatars list-unstyled">
                                                                <li>
                                                                    <div class="avatar bg-primary">
                                                                        <i class="fas fa-file"></i>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <img alt="David Whittaker" src="./DoAnFile/Admin-BWD/assets/images/avatar-4.jpg" class="avatar filter-by-data-title" data-title="David Whittaker" data-toggle="tooltip" data-filter-by="data-title">
                                                                </li>
                                                            </ul>
                                                            <div class="media-body d-flex justify-content-between align-items-center">
                                                                <div>
                                                                    <a href="#" class="name">Branding-Proforma</a>
                                                                    <br>
                                                                    <span class="name">15kb Text Document</span>
                                                                </div>
                                                                <div class="dropdown">
                                                                    <button class="btn-options" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="fas fa-ellipsis-v"></i>
                                                                    </button>
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Download</a>
                                                                        <a class="dropdown-item" href="#">Share</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        <div class="media align-items-center">
                                                            <ul class="avatars list-unstyled">
                                                                <li>
                                                                    <div class="avatar bg-primary">
                                                                        <i class="fas fa-file"></i>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <img alt="David Whittaker" src="./DoAnFile/Admin-BWD/assets/images/avatar-4.jpg" class="avatar filter-by-data-title" data-title="David Whittaker" data-toggle="tooltip" data-filter-by="data-title">
                                                                </li>
                                                            </ul>
                                                            <div class="media-body d-flex justify-content-between align-items-center">
                                                                <div>
                                                                    <a href="#" class="name">Branding-Proforma</a>
                                                                    <br>
                                                                    <span class="name">15kb Text Document</span>
                                                                </div>
                                                                <div class="dropdown">
                                                                    <button class="btn-options" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="fas fa-ellipsis-v"></i>
                                                                    </button>
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Download</a>
                                                                        <a class="dropdown-item" href="#">Share</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        <div class="media align-items-center">
                                                            <ul class="avatars list-unstyled">
                                                                <li>
                                                                    <div class="avatar bg-primary">
                                                                        <i class="fas fa-file"></i>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <img alt="David Whittaker" src="./DoAnFile/Admin-BWD/assets/images/avatar-4.jpg" class="avatar filter-by-data-title" data-title="David Whittaker" data-toggle="tooltip" data-filter-by="data-title">
                                                                </li>
                                                            </ul>
                                                            <div class="media-body d-flex justify-content-between align-items-center">
                                                                <div>
                                                                    <a href="#" class="name">Branding-Proforma</a>
                                                                    <br>
                                                                    <span class="name">15kb Text Document</span>
                                                                </div>
                                                                <div class="dropdown">
                                                                    <button class="btn-options" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="fas fa-ellipsis-v"></i>
                                                                    </button>
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Download</a>
                                                                        <a class="dropdown-item" href="#">Share</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        <div class="media align-items-center">
                                                            <ul class="avatars list-unstyled">
                                                                <li>
                                                                    <div class="avatar bg-primary">
                                                                        <i class="fas fa-file"></i>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <img alt="David Whittaker" src="./DoAnFile/Admin-BWD/assets/images/avatar-4.jpg" class="avatar filter-by-data-title" data-title="David Whittaker" data-toggle="tooltip" data-filter-by="data-title">
                                                                </li>
                                                            </ul>
                                                            <div class="media-body d-flex justify-content-between align-items-center">
                                                                <div>
                                                                    <a href="#" class="name">Branding-Proforma</a>
                                                                    <br>
                                                                    <span class="name">15kb Text Document</span>
                                                                </div>
                                                                <div class="dropdown">
                                                                    <button class="btn-options" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="fas fa-ellipsis-v"></i>
                                                                    </button>
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Download</a>
                                                                        <a class="dropdown-item" href="#">Share</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        <div class="media align-items-center">
                                                            <ul class="avatars list-unstyled">
                                                                <li>
                                                                    <div class="avatar bg-primary">
                                                                        <i class="fas fa-file"></i>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <img alt="David Whittaker" src="./DoAnFile/Admin-BWD/assets/images/avatar-4.jpg" class="avatar filter-by-data-title" data-title="David Whittaker" data-toggle="tooltip" data-filter-by="data-title">
                                                                </li>
                                                            </ul>
                                                            <div class="media-body d-flex justify-content-between align-items-center">
                                                                <div>
                                                                    <a href="#" class="name">Branding-Proforma</a>
                                                                    <br>
                                                                    <span class="name">15kb Text Document</span>
                                                                </div>
                                                                <div class="dropdown">
                                                                    <button class="btn-options" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="fas fa-ellipsis-v"></i>
                                                                    </button>
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Download</a>
                                                                        <a class="dropdown-item" href="#">Share</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        <div class="media align-items-center">
                                                            <ul class="avatars list-unstyled">
                                                                <li>
                                                                    <div class="avatar bg-primary">
                                                                        <i class="fas fa-file"></i>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <img alt="David Whittaker" src="./DoAnFile/Admin-BWD/assets/images/avatar-4.jpg" class="avatar filter-by-data-title" data-title="David Whittaker" data-toggle="tooltip" data-filter-by="data-title">
                                                                </li>
                                                            </ul>
                                                            <div class="media-body d-flex justify-content-between align-items-center">
                                                                <div>
                                                                    <a href="#" class="name">Branding-Proforma</a>
                                                                    <br>
                                                                    <span class="name">15kb Text Document</span>
                                                                </div>
                                                                <div class="dropdown">
                                                                    <button class="btn-options" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="fas fa-ellipsis-v"></i>
                                                                    </button>
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Download</a>
                                                                        <a class="dropdown-item" href="#">Share</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        <div class="media align-items-center">
                                                            <ul class="avatars list-unstyled">
                                                                <li>
                                                                    <div class="avatar bg-primary">
                                                                        <i class="fas fa-file"></i>
                                                                    </div>
                                                                </li>
                                                                <li>
                                                                    <img alt="David Whittaker" src="./DoAnFile/Admin-BWD/assets/images/avatar-4.jpg" class="avatar filter-by-data-title" data-title="David Whittaker" data-toggle="tooltip" data-filter-by="data-title">
                                                                </li>
                                                            </ul>
                                                            <div class="media-body d-flex justify-content-between align-items-center">
                                                                <div>
                                                                    <a href="#" class="name">Branding-Proforma</a>
                                                                    <br>
                                                                    <span class="name">15kb Text Document</span>
                                                                </div>
                                                                <div class="dropdown">
                                                                    <button class="btn-options" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                        <i class="fas fa-ellipsis-v"></i>
                                                                    </button>
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Download</a>
                                                                        <a class="dropdown-item" href="#">Share</a>
                                                                        <div class="dropdown-divider"></div>
                                                                        <a class="dropdown-item text-danger" href="#">Delete</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="./DoAnFile/Admin-BWD/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="./DoAnFile/Admin-BWD/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="./DoAnFile/Admin-BWD/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    
    <script src="./DoAnFile/Admin-BWD/assets/vendor/dropzone/dropzone.js"></script>
    <script src="./DoAnFile/Admin-BWD/assets/libs/js/main-js.js"></script>
</body>
 
</html>