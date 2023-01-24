<%@ page import="com.flexbook.flexbook.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.flexbook.flexbook.DAO.PostDatabase" %>
<%@ page import="com.flexbook.flexbook.model.Post" %>
<%@ page import="com.flexbook.flexbook.utilities.ConnectionManager" %>

<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- fontawesome -->
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />
    <!-- bootstrap -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
            crossorigin="anonymous"
    />
    <!-- main style -->
    <link rel="stylesheet" href="./main.css"/>
    <title>Flexbook</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:300i,400,700&display=swap" rel="stylesheet">
    <style type="text/css">
        body {
            font-family: "Nunito Sans";
        }
    </style>
</head>
<body class="bg-gray postion-relative">


<%
    User user = (User) session.getAttribute("user");
    PostDatabase postData = new PostDatabase(ConnectionManager.getConnection());
    List<Post> posts = postData.getPosts(user);

    if (session.getAttribute("message") != null) {%>
<div class="alert alert-primary" role="alert">
    <%=session.getAttribute("message").toString()%>
</div>
<%
    }


    if (user == null) {
        session.setAttribute("Registration Error", "!!!Please Login first");
        response.sendRedirect("index.jsp");
    } else {
%>
<!-- ================= Appbar ================= -->
<div
        class="bg-white d-flex align-items-center fixed-top shadow"
        style="min-height: 56px; z-index: 5"
>
    <div class="container-fluid">
        <div class="row align-items-center">
            <!-- search -->
            <div class="col d-flex align-items-center">
                <!-- logo -->
                <i class="fab fa-facebook text-primary" style="font-size: 3rem"></i>
                <!-- search bar -->
                <div class="input-group ms-2" type="button">
                    <!-- mobile -->
                    <span
                            class="input-group-prepend d-lg-none"
                            id="searchMenu"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                            data-bs-auto-close="outside"
                    >
                <div
                        class="input-group-text bg-gray border-0 rounded-circle"
                        style="min-height: 40px"
                >
                  <i class="fas fa-search text-muted"></i>
                </div>
              </span>
                    <!-- desktop -->
                    <span
                            class="input-group-prepend d-none d-lg-block"
                            id="searchMenu"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                            data-bs-auto-close="outside"
                    >
                <div
                        class="input-group-text bg-gray border-0 rounded-pill"
                        style="min-height: 40px; min-width: 230px"
                >
                  <i class="fas fa-search me-2 text-muted"></i>
                  <p class="m-0 fs-7 text-muted">Search Flexbook</p>
                </div>
              </span>
                    <!-- search menu -->
                    <ul
                            class="dropdown-menu overflow-auto border-0 shadow p-3"
                            aria-labelledby="searchMenu"
                            style="width: 20em; max-height: 600px"
                    >
                        <!-- search input -->
                        <li>
                            <input
                                    type="text"
                                    class="rounded-pill border-0 bg-gray dropdown-item"
                                    placeholder="Search Flexbook..."
                                    autofocus
                            />
                        </li>
                        <!-- search 1 -->
                        <li class="my-4">
                            <div
                                    class="
                      alert
                      fade
                      show
                      dropdown-item
                      p-1
                      m-0
                      d-flex
                      align-items-center
                      justify-content-between
                    "
                                    role="alert"
                            >
                                <div class="d-flex align-items-center">
                                    <img
                                            src="https://source.unsplash.com/random/1"
                                            alt="avatar"
                                            class="rounded-circle me-2"
                                            style="width: 35px; height: 35px; object-fit: cover"
                                    />
                                    <p class="m-0">Lorem ipsum</p>
                                </div>
                                <button
                                        type="button"
                                        class="btn-close p-0 m-0"
                                        data-bs-dismiss="alert"
                                        aria-label="Close"
                                ></button>
                            </div>
                        </li>
                        <!-- search 2 -->
                        <li class="my-4">
                            <div
                                    class="
                      alert
                      fade
                      show
                      dropdown-item
                      p-1
                      m-0
                      d-flex
                      align-items-center
                      justify-content-between
                    "
                                    role="alert"
                            >
                                <div class="d-flex align-items-center">
                                    <img
                                            src="https://source.unsplash.com/random/2"
                                            alt="avatar"
                                            class="rounded-circle me-2"
                                            style="width: 35px; height: 35px; object-fit: cover"
                                    />
                                    <p class="m-0">Lorem ipsum</p>
                                </div>
                                <button
                                        type="button"
                                        class="btn-close p-0 m-0"
                                        data-bs-dismiss="alert"
                                        aria-label="Close"
                                ></button>
                            </div>
                        </li>
                        <!-- search 3 -->
                        <li class="my-4">
                            <div
                                    class="
                      alert
                      fade
                      show
                      dropdown-item
                      p-1
                      m-0
                      d-flex
                      align-items-center
                      justify-content-between
                    "
                                    role="alert"
                            >
                                <div class="d-flex align-items-center">
                                    <img
                                            src="https://source.unsplash.com/random/3"
                                            alt="avatar"
                                            class="rounded-circle me-2"
                                            style="width: 35px; height: 35px; object-fit: cover"
                                    />
                                    <p class="m-0">Lorem ipsum</p>
                                </div>
                                <button
                                        type="button"
                                        class="btn-close p-0 m-0"
                                        data-bs-dismiss="alert"
                                        aria-label="Close"
                                ></button>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- nav -->
            <div class="col d-none d-xl-flex justify-content-center">
                <!-- home -->
                <div class="mx-4 nav__btn nav__btn-active">
                    <button type="button" class="btn px-4">
                        <i class="fas fa-home text-muted fs-4"></i>
                    </button>
                </div>
                <!-- market -->
                <div class="mx-4 nav__btn">
                    <button type="button" class="btn px-4">
                        <i class="fas fa-store text-muted fs-4"></i>
                    </button>
                </div>
                <!-- group -->
                <div class="mx-4 nav__btn">
                    <button type="button" class="btn px-4">
                        <i
                                type="button"
                                class="position-relative fas fa-users text-muted fs-4"
                        >
                  <span
                          class="
                      position-absolute
                      top-0
                      start-100
                      translate-middle
                      badge
                      rounded-pill
                      bg-danger
                    "
                          style="font-size: 0.5rem"
                  >
                    1
                    <span class="visually-hidden"></span>
                  </span>
                        </i>
                    </button>
                </div>
                <!-- gaming -->
                <div class="mx-4 nav__btn">
                    <button type="button" class="btn px-4">
                        <i class="fas fa-gamepad text-muted fs-4"></i>
                    </button>
                </div>
            </div>
            <!-- menus -->
            <div class="col d-flex align-items-center justify-content-end">
                <!-- avatar -->
                <div
                        class="align-items-center justify-content-center d-none d-xl-flex"
                >
                    <img
                            src="https://source.unsplash.com/collection/happy-people"
                            class="rounded-circle me-2"
                            alt="avatar"
                            style="width: 38px; height: 38px; object-fit: cover"
                    />
                    <p class="m-0"><%=user.getFirstname()%>
                    </p>
                </div>
                <!-- main menu -->
                <div
                        class="
                rounded-circle
                p-1
                bg-gray
                d-flex
                align-items-center
                justify-content-center
                mx-2
              "
                        style="width: 38px; height: 38px"
                        type="button"
                        id="mainMenu"
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                        data-bs-auto-close="outside"
                >
                    <i class="fas fa-ellipsis-h"></i>
                </div>
                <!-- main menu dd -->
                <ul
                        class="dropdown-menu border-0 shadow p-3 overflow-auto"
                        aria-labelledby="mainMenu"
                        style="width: 23em; max-height: 600px"
                >
                    <!-- menu -->
                    <div>
                        <!-- header -->
                        <li class="p-1 mx-2">
                            <h2>Menu</h2>
                        </li>
                        <!-- search -->
                        <li class="p-1">
                            <div
                                    class="input-group-text bg-gray border-0 rounded-pill"
                                    style="min-height: 40px; min-width: 230px"
                            >
                                <i class="fas fa-search me-2 text-muted"></i>
                                <input
                                        type="text"
                                        class="form-control rounded-pill border-0 bg-gray"
                                        placeholder="Search Menu"
                                />
                            </div>
                        </li>
                        <!-- social items -->
                        <h4 class="m-2">Social</h4>
                        <!-- s1 -->
                        <li class="my-2 p-1">
                            <a
                                    href="#"
                                    class="
                      text-decoration-none text-dark
                      d-flex
                      align-items-center
                      justify-content-between
                    "
                            >
                                <div class="p-2">
                                    <img
                                            src="https://static.xx.fbcdn.net/rsrc.php/v3/yj/r/Y7r38CcFEw5.png"
                                            alt="icon from fb"
                                            class="rounded-circle"
                                            style="width: 48px; height: 48px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="m-0">Campus</p>
                                    <span class="fs-7 text-muted"
                                    >Lorem, ipsum dolor sit amet consectetur adipisicing
                        elit. Odio, commodi.</span
                                    >
                                </div>
                            </a>
                        </li>
                        <!-- s2 -->
                        <li class="my-2 p-1">
                            <a
                                    href="#"
                                    class="
                      text-decoration-none text-dark
                      d-flex
                      align-items-center
                      justify-content-between
                    "
                            >
                                <div class="p-2">
                                    <img
                                            src="https://static.xx.fbcdn.net/rsrc.php/v3/yx/r/N7UOh8REweU.png"
                                            alt="icon from fb"
                                            class="rounded-circle"
                                            style="width: 48px; height: 48px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="m-0">Events</p>
                                    <span class="fs-7 text-muted"
                                    >Lorem, ipsum dolor sit amet consectetur adipisicing
                        elit. Odio, commodi.</span
                                    >
                                </div>
                            </a>
                        </li>
                        <!-- s3 -->
                        <li class="my-2 p-1">
                            <a
                                    href="#"
                                    class="
                      text-decoration-none text-dark
                      d-flex
                      align-items-center
                      justify-content-between
                    "
                            >
                                <div class="p-2">
                                    <img
                                            src="https://static.xx.fbcdn.net/rsrc.php/v3/yj/r/tSXYIzZlfrS.png"
                                            alt="icon from fb"
                                            class="rounded-circle"
                                            style="width: 48px; height: 48px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="m-0">Friends</p>
                                    <span class="fs-7 text-muted"
                                    >Lorem, ipsum dolor sit amet consectetur adipisicing
                        elit. Odio, commodi.</span
                                    >
                                </div>
                            </a>
                        </li>
                        <!-- s4 -->
                        <li class="my-2 p-1">
                            <a
                                    href="#"
                                    class="
                      text-decoration-none text-dark
                      d-flex
                      align-items-center
                      justify-content-between
                    "
                            >
                                <div class="p-2">
                                    <img
                                            src="https://static.xx.fbcdn.net/rsrc.php/v3/yj/r/Im_0d7HFH4n.png"
                                            alt="icon from fb"
                                            class="rounded-circle"
                                            style="width: 48px; height: 48px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="m-0">Groups</p>
                                    <span class="fs-7 text-muted"
                                    >Lorem, ipsum dolor sit amet consectetur adipisicing
                        elit. Odio, commodi.</span
                                    >
                                </div>
                            </a>
                        </li>
                        <!-- s5 -->
                        <li class="my-2 p-1">
                            <a
                                    href="#"
                                    class="
                      text-decoration-none text-dark
                      d-flex
                      align-items-center
                      justify-content-between
                    "
                            >
                                <div class="p-2">
                                    <img
                                            src="https://static.xx.fbcdn.net/rsrc.php/v3/yo/r/hLkEFzsCyXC.png"
                                            alt="icon from fb"
                                            class="rounded-circle"
                                            style="width: 48px; height: 48px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="m-0">News Feed</p>
                                    <span class="fs-7 text-muted"
                                    >Lorem, ipsum dolor sit amet consectetur adipisicing
                        elit. Odio, commodi.</span
                                    >
                                </div>
                            </a>
                        </li>
                        <!-- s6 -->
                        <li class="my-2 p-1">
                            <a
                                    href="#"
                                    class="
                      text-decoration-none text-dark
                      d-flex
                      align-items-center
                      justify-content-between
                    "
                            >
                                <div class="p-2">
                                    <img
                                            src="https://static.xx.fbcdn.net/rsrc.php/v3/yj/r/0gH3vbvr8Ee.png"
                                            alt="icon from fb"
                                            class="rounded-circle"
                                            style="width: 48px; height: 48px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="m-0">Pages</p>
                                    <span class="fs-7 text-muted"
                                    >Lorem, ipsum dolor sit amet consectetur adipisicing
                        elit. Odio, commodi.</span
                                    >
                                </div>
                            </a>
                        </li>
                        <hr/>
                        <!-- ent items -->
                        <h4 class="m-2">Entertainment</h4>
                        <!-- e1 -->
                        <li class="my-2 p-1">
                            <a
                                    href="#"
                                    class="
                      text-decoration-none text-dark
                      d-flex
                      align-items-center
                      justify-content-between
                    "
                            >
                                <div class="p-2">
                                    <img
                                            src="https://static.xx.fbcdn.net/rsrc.php/v3/yj/r/Y7r38CcFEw5.png"
                                            alt="icon from fb"
                                            class="rounded-circle"
                                            style="width: 48px; height: 48px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="m-0">Campus</p>
                                    <span class="fs-7 text-muted"
                                    >Lorem, ipsum dolor sit amet consectetur adipisicing
                        elit. Odio, commodi.</span
                                    >
                                </div>
                            </a>
                        </li>
                        <!-- e2 -->
                        <li class="my-2 p-1">
                            <a
                                    href="#"
                                    class="
                      text-decoration-none text-dark
                      d-flex
                      align-items-center
                      justify-content-between
                    "
                            >
                                <div class="p-2">
                                    <img
                                            src="https://static.xx.fbcdn.net/rsrc.php/v3/yx/r/N7UOh8REweU.png"
                                            alt="icon from fb"
                                            class="rounded-circle"
                                            style="width: 48px; height: 48px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="m-0">Events</p>
                                    <span class="fs-7 text-muted"
                                    >Lorem, ipsum dolor sit amet consectetur adipisicing
                        elit. Odio, commodi.</span
                                    >
                                </div>
                            </a>
                        </li>
                        <!-- e3 -->
                        <li class="my-2 p-1">
                            <a
                                    href="#"
                                    class="
                      text-decoration-none text-dark
                      d-flex
                      align-items-center
                      justify-content-between
                    "
                            >
                                <div class="p-2">
                                    <img
                                            src="https://static.xx.fbcdn.net/rsrc.php/v3/yj/r/tSXYIzZlfrS.png"
                                            alt="icon from fb"
                                            class="rounded-circle"
                                            style="width: 48px; height: 48px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="m-0">Friends</p>
                                    <span class="fs-7 text-muted"
                                    >Lorem, ipsum dolor sit amet consectetur adipisicing
                        elit. Odio, commodi.</span
                                    >
                                </div>
                            </a>
                        </li>
                    </div>
                    <hr/>
                    <!-- create -->
                    <div>
                        <!-- header -->
                        <li class="p-1 mx-2">
                            <h2>Create</h2>
                        </li>
                        <!-- c-1 -->
                        <li class="my-2 p-1">
                            <a
                                    href="#"
                                    class="
                      text-decoration-none text-dark
                      d-flex
                      align-items-center
                    "
                            >
                                <div
                                        class="
                        rounded-circle
                        bg-gray
                        p-1
                        d-flex
                        align-items-center
                        justify-content-center
                        me-3
                      "
                                        style="width: 38px; height: 38px"
                                >
                                    <i class="fas fa-edit"></i>
                                </div>
                                <div>
                                    <p class="m-0">Post</p>
                                </div>
                            </a>
                        </li>
                        <!-- c-2 -->
                        <li class="my-2 p-1">
                            <a
                                    href="#"
                                    class="
                      text-decoration-none text-dark
                      d-flex
                      align-items-center
                    "
                            >
                                <div
                                        class="
                        rounded-circle
                        bg-gray
                        p-1
                        d-flex
                        align-items-center
                        justify-content-center
                        me-3
                      "
                                        style="width: 38px; height: 38px"
                                >
                                    <i class="fas fa-book-open"></i>
                                </div>
                                <div>
                                    <p class="m-0">Story</p>
                                </div>
                            </a>
                        </li>
                        <!-- c-3 -->
                        <li class="my-2 p-1">
                            <a
                                    href="#"
                                    class="
                      text-decoration-none text-dark
                      d-flex
                      align-items-center
                    "
                            >
                                <div
                                        class="
                        rounded-circle
                        bg-gray
                        p-1
                        d-flex
                        align-items-center
                        justify-content-center
                        me-3
                      "
                                        style="width: 38px; height: 38px"
                                >
                                    <i class="fas fa-video"></i>
                                </div>
                                <div>
                                    <p class="m-0">Video</p>
                                </div>
                            </a>
                        </li>
                        <hr/>
                        <!-- c-4 -->
                        <li class="my-2 p-1">
                            <a
                                    href="#"
                                    class="
                      text-decoration-none text-dark
                      d-flex
                      align-items-center
                    "
                            >
                                <div
                                        class="
                        rounded-circle
                        bg-gray
                        p-1
                        d-flex
                        align-items-center
                        justify-content-center
                        me-3
                      "
                                        style="width: 38px; height: 38px"
                                >
                                    <i class="fas fa-flag"></i>
                                </div>
                                <div>
                                    <p class="m-0">Page</p>
                                </div>
                            </a>
                        </li>
                        <!-- c-5 -->
                        <li class="my-2 p-1">
                            <a
                                    href="#"
                                    class="
                      text-decoration-none text-dark
                      d-flex
                      align-items-center
                    "
                            >
                                <div
                                        class="
                        rounded-circle
                        bg-gray
                        p-1
                        d-flex
                        align-items-center
                        justify-content-center
                        me-3
                      "
                                        style="width: 38px; height: 38px"
                                >
                                    <i class="fas fa-bullhorn"></i>
                                </div>
                                <div>
                                    <p class="m-0">Add</p>
                                </div>
                            </a>
                        </li>
                        <!-- c-6 -->
                        <li class="my-2 p-1">
                            <a
                                    href="#"
                                    class="
                      text-decoration-none text-dark
                      d-flex
                      align-items-center
                    "
                            >
                                <div
                                        class="
                        rounded-circle
                        bg-gray
                        p-1
                        d-flex
                        align-items-center
                        justify-content-center
                        me-3
                      "
                                        style="width: 38px; height: 38px"
                                >
                                    <i class="fas fa-users"></i>
                                </div>
                                <div>
                                    <p class="m-0">Group</p>
                                </div>
                            </a>
                        </li>
                        <!-- c-7-->
                        <li class="my-2 p-1">
                            <a
                                    href="#"
                                    class="
                      text-decoration-none text-dark
                      d-flex
                      align-items-center
                    "
                            >
                                <div
                                        class="
                        rounded-circle
                        bg-gray
                        p-1
                        d-flex
                        align-items-center
                        justify-content-center
                        me-3
                      "
                                        style="width: 38px; height: 38px"
                                >
                                    <i class="fas fa-book"></i>
                                </div>
                                <div>
                                    <p class="m-0">Event</p>
                                </div>
                            </a>
                        </li>
                        <!-- c-8 -->
                        <li class="my-2 p-1">
                            <a
                                    href="#"
                                    class="
                      text-decoration-none text-dark
                      d-flex
                      align-items-center
                    "
                            >
                                <div
                                        class="
                        rounded-circle
                        bg-gray
                        p-1
                        d-flex
                        align-items-center
                        justify-content-center
                        me-3
                      "
                                        style="width: 38px; height: 38px"
                                >
                                    <i class="fas fa-shopping-basket"></i>
                                </div>
                                <div>
                                    <p class="m-0">Marketplace Listing</p>
                                </div>
                            </a>
                        </li>
                        <!-- c-9 -->
                        <li class="my-2 p-1">
                            <a
                                    href="#"
                                    class="
                      text-decoration-none text-dark
                      d-flex
                      align-items-center
                    "
                            >
                                <div
                                        class="
                        rounded-circle
                        bg-gray
                        p-1
                        d-flex
                        align-items-center
                        justify-content-center
                        me-3
                      "
                                        style="width: 38px; height: 38px"
                                >
                                    <i class="fas fa-suitcase"></i>
                                </div>
                                <div>
                                    <p class="m-0">Job</p>
                                </div>
                            </a>
                        </li>
                    </div>
                </ul>
                <!-- chat -->
                <div
                        class="
                rounded-circle
                p-1
                bg-gray
                d-flex
                align-items-center
                justify-content-center
                mx-2
              "
                        style="width: 38px; height: 38px"
                        type="button"
                        id="chatMenu"
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                        data-bs-auto-close="outside"
                >
                    <i class="fas fa-comment"></i>
                </div>
                <!-- chat  dd -->
                <ul
                        class="dropdown-menu border-0 shadow p-3 overflow-auto"
                        aria-labelledby="chatMenu"
                        style="width: 23em; max-height: 600px"
                >
                    <!-- header -->
                    <li class="p-1">
                        <div class="d-flex justify-content-between">
                            <h2>Message</h2>
                            <div>
                                <!-- setting -->
                                <i
                                        class="fas fa-ellipsis-h text-muted mx-2"
                                        type="button"
                                        data-bs-toggle="dropdown"
                                ></i>
                                <!-- setting dd -->
                                <ul class="dropdown-menu shadow" style="width: 18em">
                                    <!-- title -->
                                    <div class="p-2">
                                        <h5>Chat Settings</h5>
                                        <span class="text-muted fs-7"
                                        >Customize your Messenger experience.</span
                                        >
                                    </div>
                                    <hr/>
                                    <!-- incoming sound -->
                                    <li>
                                        <div
                                                class="
                            dropdown-item
                            d-flex
                            align-items-center
                            justify-content-between
                          "
                                        >
                                            <!-- icon -->
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-phone-alt me-3"></i>
                                                <p class="m-0">Incoming call sounds</p>
                                            </div>
                                            <!-- toggle -->
                                            <div class="form-check form-switch m-0">
                                                <input
                                                        class="form-check-input"
                                                        type="checkbox"
                                                        id="flexSwitchCheckChecked"
                                                        checked
                                                />
                                                <label
                                                        class="form-check-label"
                                                        for="flexSwitchCheckChecked"
                                                ></label>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- message sound -->
                                    <li>
                                        <div
                                                class="
                            dropdown-item
                            d-flex
                            align-items-center
                            justify-content-between
                          "
                                        >
                                            <!-- icon -->
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-volume-off me-4 fs-4"></i>
                                                <p class="m-0">Message sounds</p>
                                            </div>
                                            <!-- toggle -->
                                            <div class="form-check form-switch m-0">
                                                <input
                                                        class="form-check-input"
                                                        type="checkbox"
                                                        id="flexSwitchCheckChecked"
                                                        checked
                                                />
                                                <label
                                                        class="form-check-label"
                                                        for="flexSwitchCheckChecked"
                                                ></label>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- popup message -->
                                    <li>
                                        <div
                                                class="
                            dropdown-item
                            d-flex
                            align-items-center
                            justify-content-between
                          "
                                        >
                                            <!-- icon -->
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-spinner me-3"></i>
                                                <p class="m-0">Pop-up new messages</p>
                                            </div>
                                            <!-- toggle -->
                                            <div class="form-check form-switch m-0">
                                                <input
                                                        class="form-check-input"
                                                        type="checkbox"
                                                        id="flexSwitchCheckChecked"
                                                        checked
                                                />
                                                <label
                                                        class="form-check-label"
                                                        for="flexSwitchCheckChecked"
                                                ></label>
                                            </div>
                                        </div>
                                        <span class="ms-5 text-muted fs-7"
                                        >Automatically open new messages.</span
                                        >
                                    </li>
                                    <hr class="m-0"/>
                                    <!-- item 1 -->
                                    <li>
                                        <div
                                                class="
                            dropdown-item
                            d-flex
                            align-items-center
                            justify-content-between
                          "
                                        >
                                            <!-- icon -->
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-toggle-off me-3"></i>
                                                <p class="m-0">Turn Off Active Status</p>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- item 2 -->
                                    <li>
                                        <div
                                                class="
                            dropdown-item
                            d-flex
                            align-items-center
                            justify-content-between
                          "
                                        >
                                            <!-- icon -->
                                            <div class="d-flex align-items-center">
                                                <i class="far fa-comment-alt me-3"></i>
                                                <p class="m-0">Message Request</p>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- item 3 -->
                                    <li>
                                        <div
                                                class="
                            dropdown-item
                            d-flex
                            align-items-center
                            justify-content-between
                          "
                                        >
                                            <!-- icon -->
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-share-square me-3"></i>
                                                <p class="m-0">Message delivery settings</p>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- item 4 -->
                                    <li>
                                        <div
                                                class="
                            dropdown-item
                            d-flex
                            align-items-center
                            justify-content-between
                          "
                                        >
                                            <!-- icon -->
                                            <div class="d-flex align-items-center">
                                                <i class="fas fa-shield-alt me-3"></i>
                                                <p class="m-0">Block settings</p>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <i
                                        class="fas fa-expand-arrows-alt text-muted mx-2"
                                        type="button"
                                ></i>
                                <!-- new message -->
                                <i
                                        class="fas fa-edit text-muted mx-2"
                                        type="button"
                                        data-bs-toggle="modal"
                                        data-bs-target="#newChat"
                                ></i>
                            </div>
                        </div>
                    </li>
                    <!-- search -->
                    <li class="p-1">
                        <div
                                class="input-group-text bg-gray border-0 rounded-pill"
                                style="min-height: 40px; min-width: 230px"
                        >
                            <i class="fas fa-search me-2 text-muted"></i>
                            <input
                                    type="text"
                                    class="form-control rounded-pill border-0 bg-gray"
                                    placeholder="Search Messenger"
                            />
                        </div>
                    </li>
                    <!-- message 1 -->
                    <li
                            class="my-2 p-1"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#singleChat1"
                    >
                        <div class="d-flex align-items-center justify-content-between">
                            <!-- big avatar -->
                            <div class="d-flex align-items-center justify-content-evenly">
                                <div class="p-2">
                                    <img
                                            src="https://source.unsplash.com/random/1"
                                            alt="avatar"
                                            class="rounded-circle"
                                            style="width: 58px; height: 58px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="fs-7 m-0">Mike</p>
                                    <span class="fs-7 text-muted"
                                    >Lorem ipsum &#8226; 7d</span
                                    >
                                </div>
                            </div>
                            <!-- small avatar -->
                            <div class="p-2">
                                <img
                                        src="https://source.unsplash.com/random/1"
                                        alt="avatar"
                                        class="rounded-circle"
                                        style="width: 15px; height: 15px; object-fit: cover"
                                />
                            </div>
                        </div>
                    </li>
                    <!-- message 2 -->
                    <li
                            class="my-2 p-1"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#singleChat2"
                    >
                        <div class="d-flex align-items-center justify-content-between">
                            <!-- big avatar -->
                            <div class="d-flex align-items-center justify-content-evenly">
                                <div class="p-2">
                                    <img
                                            src="https://source.unsplash.com/random/2"
                                            alt="avatar"
                                            class="rounded-circle"
                                            style="width: 58px; height: 58px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="fs-7 m-0">
                                        Tuan
                                        <span class="fs-7 text-muted"
                                        >Lorem ipsum &#8226; 7d</span
                                        >
                                    </p>
                                </div>
                            </div>
                            <!-- small avatar -->
                            <div class="p-2">
                                <img
                                        src="https://source.unsplash.com/random/2"
                                        alt="avatar"
                                        class="rounded-circle"
                                        style="width: 15px; height: 15px; object-fit: cover"
                                />
                            </div>
                        </div>
                    </li>
                    <!-- message 3 -->
                    <li
                            class="my-2 p-1"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#singleChat3"
                    >
                        <div class="d-flex align-items-center justify-content-between">
                            <!-- big avatar -->
                            <div class="d-flex align-items-center justify-content-evenly">
                                <div class="p-2">
                                    <img
                                            src="https://source.unsplash.com/random/3"
                                            alt="avatar"
                                            class="rounded-circle"
                                            style="width: 58px; height: 58px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="fs-7 m-0">Jerry</p>
                                    <span class="fs-7 text-muted"
                                    >Lorem ipsum &#8226; 7d</span
                                    >
                                </div>
                            </div>
                            <!-- small avatar -->
                            <div class="p-2">
                                <img
                                        src="https://source.unsplash.com/random/3"
                                        alt="avatar"
                                        class="rounded-circle"
                                        style="width: 15px; height: 15px; object-fit: cover"
                                />
                            </div>
                        </div>
                    </li>
                    <!-- message 4 -->
                    <li
                            class="my-2 p-1"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#singleChat4"
                    >
                        <div class="d-flex align-items-center justify-content-between">
                            <!-- big avatar -->
                            <div class="d-flex align-items-center justify-content-evenly">
                                <div class="p-2">
                                    <img
                                            src="https://source.unsplash.com/random/4"
                                            alt="avatar"
                                            class="rounded-circle"
                                            style="width: 58px; height: 58px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="fs-7 m-0">Tony</p>
                                    <span class="fs-7 text-muted"
                                    >Lorem ipsum &#8226; 7d</span
                                    >
                                </div>
                            </div>
                            <!-- small avatar -->
                            <div class="p-2">
                                <img
                                        src="https://source.unsplash.com/random/4"
                                        alt="avatar"
                                        class="rounded-circle"
                                        style="width: 15px; height: 15px; object-fit: cover"
                                />
                            </div>
                        </div>
                    </li>
                    <!-- message 5 -->
                    <li
                            class="my-2 p-1"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#singleChat5"
                    >
                        <div class="d-flex align-items-center justify-content-between">
                            <!-- big avatar -->
                            <div class="d-flex align-items-center justify-content-evenly">
                                <div class="p-2">
                                    <img
                                            src="https://source.unsplash.com/random/5"
                                            alt="avatar"
                                            class="rounded-circle"
                                            style="width: 58px; height: 58px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="fs-7 m-0">Phu</p>
                                    <span class="fs-7 text-muted"
                                    >Lorem ipsum &#8226; 7d</span
                                    >
                                </div>
                            </div>
                            <!-- small avatar -->
                            <div class="p-2">
                                <img
                                        src="https://source.unsplash.com/random/5"
                                        alt="avatar"
                                        class="rounded-circle"
                                        style="width: 15px; height: 15px; object-fit: cover"
                                />
                            </div>
                        </div>
                    </li>
                    <hr class="m-0"/>
                    <a href="#" class="text-decoration-none">
                        <p class="fw-bold text-center pt-3 m-0">See All in Messenger</p>
                    </a>
                </ul>
                <!-- notifications -->
                <div
                        class="
                rounded-circle
                p-1
                bg-gray
                d-flex
                align-items-center
                justify-content-center
                mx-2
              "
                        style="width: 38px; height: 38px"
                        type="button"
                        id="notMenu"
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                        data-bs-auto-close="outside"
                >
                    <i class="fas fa-bell"></i>
                </div>
                <!-- notifications dd -->
                <ul
                        class="dropdown-menu border-0 shadow p-3"
                        aria-labelledby="notMenu"
                        style="width: 23em; max-height: 600px; overflow-y: auto"
                >
                    <!-- header -->
                    <li class="p-1">
                        <div class="d-flex justify-content-between">
                            <h2>Notifications</h2>
                            <div>
                                <i
                                        class="
                        fas
                        fa-ellipsis-h
                        pointer
                        p-2
                        rounded-circle
                        bg-gray
                      "
                                        type="button"
                                        data-bs-toggle="dropdown"
                                ></i>
                                <ul class="dropdown-menu">
                                    <li
                                            class="dropdown-item d-flex align-items-center"
                                            type="button"
                                    >
                                        <i class="fas fa-check me-3 text-muted"></i>
                                        <p class="m-0">Mark all as read</p>
                                    </li>
                                    <li
                                            class="dropdown-item d-flex align-items-center"
                                            type="button"
                                    >
                                        <i class="fas fa-cog me-3 text-muted"></i>
                                        <p class="m-0">Privacy Checkup</p>
                                    </li>
                                    <li
                                            class="dropdown-item d-flex align-items-center"
                                            type="button"
                                    >
                                        <i class="fas fa-desktop me-3 text-muted"></i>
                                        <p class="m-0">Privacy Shortcuts</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="d-flex" type="button">
                            <p class="rounded-pill bg-gray p-2">All</p>
                            <p class="ms-3 rounded-pill bg-primary p-2 text-white">
                                Unread
                            </p>
                        </div>
                    </li>
                    <!-- news -->
                    <div class="d-flex justify-content-between mx-2">
                        <h5>New</h5>
                        <a href="#" class="text-decoration-none">See All</a>
                    </div>
                    <!-- news 1 -->
                    <li class="my-2 p-1">
                        <a
                                href="#"
                                class="
                    d-flex
                    align-items-center
                    justify-content-evenly
                    text-decoration-none text-dark
                  "
                        >
                            <div class="d-flex align-items-center justify-content-evenly">
                                <div class="p-2">
                                    <img
                                            src="https://source.unsplash.com/random/1"
                                            alt="avatar"
                                            class="rounded-circle"
                                            style="width: 58px; height: 58px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="fs-7 m-0">
                                        Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                        Harum unde amet at nulla quae porro.
                                    </p>
                                    <span class="fs-7 text-primary">about an hour ago</span>
                                </div>
                            </div>
                            <i class="fas fa-circle fs-7 text-primary"></i>
                        </a>
                    </li>
                    <!-- news 2 -->
                    <li class="my-2 p-1">
                        <a
                                href="#"
                                class="
                    d-flex
                    align-items-center
                    justify-content-evenly
                    text-decoration-none text-dark
                  "
                        >
                            <div class="d-flex align-items-center justify-content-evenly">
                                <div class="p-2">
                                    <img
                                            src="https://source.unsplash.com/random/2"
                                            alt="avatar"
                                            class="rounded-circle"
                                            style="width: 58px; height: 58px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="fs-7 m-0">
                                        Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                        Harum unde amet at nulla quae porro.
                                    </p>
                                    <span class="fs-7 text-primary">about an hour ago</span>
                                </div>
                            </div>
                            <i class="fas fa-circle fs-7 text-primary"></i>
                        </a>
                    </li>
                    <!-- news 3 -->
                    <li class="my-2 p-1">
                        <a
                                href="#"
                                class="
                    d-flex
                    align-items-center
                    justify-content-evenly
                    text-decoration-none text-dark
                  "
                        >
                            <div class="d-flex align-items-center justify-content-evenly">
                                <div class="p-2">
                                    <img
                                            src="https://source.unsplash.com/random/3"
                                            alt="avatar"
                                            class="rounded-circle"
                                            style="width: 58px; height: 58px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="fs-7 m-0">
                                        Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                        Harum unde amet at nulla quae porro.
                                    </p>
                                    <span class="fs-7 text-primary">about an hour ago</span>
                                </div>
                            </div>
                            <i class="fas fa-circle fs-7 text-primary"></i>
                        </a>
                    </li>
                    <!-- news 4 -->
                    <li class="my-2 p-1">
                        <a
                                href="#"
                                class="
                    d-flex
                    align-items-center
                    justify-content-evenly
                    text-decoration-none text-dark
                  "
                        >
                            <div class="d-flex align-items-center justify-content-evenly">
                                <div class="p-2">
                                    <img
                                            src="https://source.unsplash.com/random/4"
                                            alt="avatar"
                                            class="rounded-circle"
                                            style="width: 58px; height: 58px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="fs-7 m-0">
                                        Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                        Harum unde amet at nulla quae porro.
                                    </p>
                                    <span class="fs-7 text-primary">about an hour ago</span>
                                </div>
                            </div>
                            <i class="fas fa-circle fs-7 text-primary"></i>
                        </a>
                    </li>
                    <!-- news 5 -->
                    <li class="my-2 p-1">
                        <a
                                href="#"
                                class="
                    d-flex
                    align-items-center
                    justify-content-evenly
                    text-decoration-none text-dark
                  "
                        >
                            <div class="d-flex align-items-center justify-content-evenly">
                                <div class="p-2">
                                    <img
                                            src="https://source.unsplash.com/random/5"
                                            alt="avatar"
                                            class="rounded-circle"
                                            style="width: 58px; height: 58px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="fs-7 m-0">
                                        Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                        Harum unde amet at nulla quae porro.
                                    </p>
                                    <span class="fs-7 text-primary">about an hour ago</span>
                                </div>
                            </div>
                            <i class="fas fa-circle fs-7 text-primary"></i>
                        </a>
                    </li>
                </ul>
                <!-- secondary menu -->
                <div
                        class="
                rounded-circle
                p-1
                bg-gray
                d-flex
                align-items-center
                justify-content-center
                mx-2
              "
                        style="width: 38px; height: 38px"
                        type="button"
                        id="secondMenu"
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                        data-bs-auto-close="outside"
                >
                    <i class="fas fa-caret-down"></i>
                </div>
                <!-- secondary menu dd -->
                <ul
                        class="dropdown-menu border-0 shadow p-3"
                        aria-labelledby="secondMenu"
                        style="width: 23em"
                >
                    <!-- avatar -->
                    <li class="dropdown-item p-1 rounded d-flex" type="button">
                        <img
                                src="https://source.unsplash.com/collection/happy-people"
                                alt="avatar"
                                class="rounded-circle me-2"
                                style="width: 45px; height: 45px; object-fit: cover"
                        />
                        <div>
                            <p class="m-0"><%=user.getFirstname()%>
                            </p>
                            <p class="m-0 text-muted">See your profile</p>
                        </div>
                    </li>
                    <hr/>
                    <!-- feedback -->
                    <li
                            class="dropdown-item p-1 rounded d-flex align-items-center"
                            type="button"
                    >
                        <i
                                class="fas fa-exclamation-circle bg-gray p-2 rounded-circle"
                        ></i>
                        <div class="ms-3">
                            <p class="m-0">Give Feedback</p>
                            <p class="m-0 text-muted fs-7">
                                Help us improve the new Flexbook.
                            </p>
                        </div>
                    </li>
                    <hr/>
                    <!-- options -->
                    <!-- 1 -->
                    <li class="dropdown-item p-1 my-3 rounded" type="button">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <div class="d-flex" data-bs-toggle="dropdown">
                                    <i class="fas fa-cog bg-gray p-2 rounded-circle"></i>
                                    <div
                                            class="
                          ms-3
                          d-flex
                          justify-content-between
                          align-items-center
                          w-100
                        "
                                    >
                                        <p class="m-0">Settings & Privacy</p>
                                        <i class="fas fa-chevron-right"></i>
                                    </div>
                                </div>
                                <!-- nested menu -->
                                <ul class="dropdown-menu">
                                    <li>
                                        <a
                                                class="dropdown-item d-flex align-items-center"
                                                href="#"
                                        >
                                            <div
                                                    class="
                              rounded-circle
                              p-1
                              bg-gray
                              d-flex
                              align-items-center
                              justify-content-center
                              me-2
                            "
                                                    style="width: 38px; height: 38px"
                                            >
                                                <i class="fas fa-cog"></i>
                                            </div>
                                            <p class="m-0">Settings</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a
                                                class="dropdown-item d-flex align-items-center"
                                                href="#"
                                        >
                                            <div
                                                    class="
                              rounded-circle
                              p-1
                              bg-gray
                              d-flex
                              align-items-center
                              justify-content-center
                              me-2
                            "
                                                    style="width: 38px; height: 38px"
                                            >
                                                <i class="fas fa-lock"></i>
                                            </div>
                                            <p class="m-0">Privacy Checkup</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a
                                                class="dropdown-item d-flex align-items-center"
                                                href="#"
                                        >
                                            <div
                                                    class="
                              rounded-circle
                              p-1
                              bg-gray
                              d-flex
                              align-items-center
                              justify-content-center
                              me-2
                            "
                                                    style="width: 38px; height: 38px"
                                            >
                                                <i class="fas fa-unlock-alt"></i>
                                            </div>
                                            <p class="m-0">Privacy Shortcuts</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a
                                                class="dropdown-item d-flex align-items-center"
                                                href="#"
                                        >
                                            <div
                                                    class="
                              rounded-circle
                              p-1
                              bg-gray
                              d-flex
                              align-items-center
                              justify-content-center
                              me-2
                            "
                                                    style="width: 38px; height: 38px"
                                            >
                                                <i class="fas fa-list"></i>
                                            </div>
                                            <p class="m-0">Activity Log</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a
                                                class="dropdown-item d-flex align-items-center"
                                                href="#"
                                        >
                                            <div
                                                    class="
                              rounded-circle
                              p-1
                              bg-gray
                              d-flex
                              align-items-center
                              justify-content-center
                              me-2
                            "
                                                    style="width: 38px; height: 38px"
                                            >
                                                <i class="fas fa-newspaper"></i>
                                            </div>
                                            <p class="m-0">News Feed Preferences</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a
                                                class="dropdown-item d-flex align-items-center"
                                                href="#"
                                        >
                                            <div
                                                    class="
                              rounded-circle
                              p-1
                              bg-gray
                              d-flex
                              align-items-center
                              justify-content-center
                              me-2
                            "
                                                    style="width: 38px; height: 38px"
                                            >
                                                <i class="fas fa-globe"></i>
                                            </div>
                                            <p class="m-0">Language</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <!-- 2 -->
                    <li class="dropdown-item p-1 my-3 rounded" type="button">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <div class="d-flex" data-bs-toggle="dropdown">
                                    <i
                                            class="
                          fas
                          fa-question-circle
                          bg-gray
                          p-2
                          rounded-circle
                        "
                                    ></i>
                                    <div
                                            class="
                          ms-3
                          d-flex
                          justify-content-between
                          align-items-center
                          w-100
                        "
                                    >
                                        <p class="m-0">Help & Support</p>
                                        <i class="fas fa-chevron-right"></i>
                                    </div>
                                </div>
                                <!-- nested menu -->
                                <ul class="dropdown-menu">
                                    <li>
                                        <a
                                                class="dropdown-item d-flex align-items-center"
                                                href="#"
                                        >
                                            <div
                                                    class="
                              rounded-circle
                              p-1
                              bg-gray
                              d-flex
                              align-items-center
                              justify-content-center
                              me-2
                            "
                                                    style="width: 38px; height: 38px"
                                            >
                                                <i class="fas fa-cog"></i>
                                            </div>
                                            <p class="m-0">Settings</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a
                                                class="dropdown-item d-flex align-items-center"
                                                href="#"
                                        >
                                            <div
                                                    class="
                              rounded-circle
                              p-1
                              bg-gray
                              d-flex
                              align-items-center
                              justify-content-center
                              me-2
                            "
                                                    style="width: 38px; height: 38px"
                                            >
                                                <i class="fas fa-lock"></i>
                                            </div>
                                            <p class="m-0">Privacy Checkup</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a
                                                class="dropdown-item d-flex align-items-center"
                                                href="#"
                                        >
                                            <div
                                                    class="
                              rounded-circle
                              p-1
                              bg-gray
                              d-flex
                              align-items-center
                              justify-content-center
                              me-2
                            "
                                                    style="width: 38px; height: 38px"
                                            >
                                                <i class="fas fa-unlock-alt"></i>
                                            </div>
                                            <p class="m-0">Privacy Shortcuts</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a
                                                class="dropdown-item d-flex align-items-center"
                                                href="#"
                                        >
                                            <div
                                                    class="
                              rounded-circle
                              p-1
                              bg-gray
                              d-flex
                              align-items-center
                              justify-content-center
                              me-2
                            "
                                                    style="width: 38px; height: 38px"
                                            >
                                                <i class="fas fa-list"></i>
                                            </div>
                                            <p class="m-0">Activity Log</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a
                                                class="dropdown-item d-flex align-items-center"
                                                href="#"
                                        >
                                            <div
                                                    class="
                              rounded-circle
                              p-1
                              bg-gray
                              d-flex
                              align-items-center
                              justify-content-center
                              me-2
                            "
                                                    style="width: 38px; height: 38px"
                                            >
                                                <i class="fas fa-newspaper"></i>
                                            </div>
                                            <p class="m-0">News Feed Preferences</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a
                                                class="dropdown-item d-flex align-items-center"
                                                href="#"
                                        >
                                            <div
                                                    class="
                              rounded-circle
                              p-1
                              bg-gray
                              d-flex
                              align-items-center
                              justify-content-center
                              me-2
                            "
                                                    style="width: 38px; height: 38px"
                                            >
                                                <i class="fas fa-globe"></i>
                                            </div>
                                            <p class="m-0">Language</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <!-- 3 -->
                    <li class="dropdown-item p-1 my-3 rounded" type="button">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <div class="d-flex" data-bs-toggle="dropdown">
                                    <i class="fas fa-moon bg-gray p-2 rounded-circle"></i>
                                    <div
                                            class="
                          ms-3
                          d-flex
                          justify-content-between
                          align-items-center
                          w-100
                        "
                                    >
                                        <p class="m-0">Display & Accessibility</p>
                                        <i class="fas fa-chevron-right"></i>
                                    </div>
                                </div>
                                <!-- nested menu -->
                                <ul class="dropdown-menu">
                                    <li>
                                        <a
                                                class="dropdown-item d-flex align-items-center"
                                                href="#"
                                        >
                                            <div
                                                    class="
                              rounded-circle
                              p-1
                              bg-gray
                              d-flex
                              align-items-center
                              justify-content-center
                              me-2
                            "
                                                    style="width: 38px; height: 38px"
                                            >
                                                <i class="fas fa-cog"></i>
                                            </div>
                                            <p class="m-0">Settings</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a
                                                class="dropdown-item d-flex align-items-center"
                                                href="#"
                                        >
                                            <div
                                                    class="
                              rounded-circle
                              p-1
                              bg-gray
                              d-flex
                              align-items-center
                              justify-content-center
                              me-2
                            "
                                                    style="width: 38px; height: 38px"
                                            >
                                                <i class="fas fa-lock"></i>
                                            </div>
                                            <p class="m-0">Privacy Checkup</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a
                                                class="dropdown-item d-flex align-items-center"
                                                href="#"
                                        >
                                            <div
                                                    class="
                              rounded-circle
                              p-1
                              bg-gray
                              d-flex
                              align-items-center
                              justify-content-center
                              me-2
                            "
                                                    style="width: 38px; height: 38px"
                                            >
                                                <i class="fas fa-unlock-alt"></i>
                                            </div>
                                            <p class="m-0">Privacy Shortcuts</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a
                                                class="dropdown-item d-flex align-items-center"
                                                href="#"
                                        >
                                            <div
                                                    class="
                              rounded-circle
                              p-1
                              bg-gray
                              d-flex
                              align-items-center
                              justify-content-center
                              me-2
                            "
                                                    style="width: 38px; height: 38px"
                                            >
                                                <i class="fas fa-list"></i>
                                            </div>
                                            <p class="m-0">Activity Log</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a
                                                class="dropdown-item d-flex align-items-center"
                                                href="#"
                                        >
                                            <div
                                                    class="
                              rounded-circle
                              p-1
                              bg-gray
                              d-flex
                              align-items-center
                              justify-content-center
                              me-2
                            "
                                                    style="width: 38px; height: 38px"
                                            >
                                                <i class="fas fa-newspaper"></i>
                                            </div>
                                            <p class="m-0">News Feed Preferences</p>
                                        </a>
                                    </li>
                                    <li>
                                        <a
                                                class="dropdown-item d-flex align-items-center"
                                                href="#"
                                        >
                                            <div
                                                    class="
                              rounded-circle
                              p-1
                              bg-gray
                              d-flex
                              align-items-center
                              justify-content-center
                              me-2
                            "
                                                    style="width: 38px; height: 38px"
                                            >
                                                <i class="fas fa-globe"></i>
                                            </div>
                                            <p class="m-0">Language</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <!-- 4 -->
                    <li class="dropdown-item p-1 my-3 rounded" type="button">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a
                                        href="./index.jsp"
                                        class="d-flex text-decoration-none text-dark"
                                >
                                    <i class="fas fa-cog bg-gray p-2 rounded-circle"></i>
                                    <div
                                            class="
                          ms-3
                          d-flex
                          justify-content-between
                          align-items-center
                          w-100
                        "
                                    >
                                        <p class="m-0">Log Out</p>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- end -->
            </div>
        </div>
    </div>
</div>
<!-- =============== New Chat Mobile =============== -->

<!-- ================= Main ================= -->
<div class="container-fluid">
    <div class="row justify-content-evenly">
        <!-- ================= Sidebar ================= -->
        <div class="col-12 col-lg-3">
            <div
                    class="d-none d-xxl-block h-100 fixed-top overflow-hidden scrollbar"
                    style="max-width: 360px; width: 100%; z-index: 4"
            >
                <ul
                        class="navbar-nav mt-4 ms-3 d-flex flex-column pb-5 mb-5"
                        style="padding-top: 56px"
                >
                    <!-- top -->
                    <!-- avatar -->
                    <li class="dropdown-item p-1 rounded">
                        <a
                                href="#"
                                class="
                    d-flex
                    align-items-center
                    text-decoration-none text-dark
                  "
                        >
                            <div class="p-2">
                                <img
                                        src="https://source.unsplash.com/collection/happy-people"
                                        alt="avatar"
                                        class="rounded-circle me-2"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                            </div>
                            <div>
                                <p class="m-0"><%=user.getFirstname()%>
                                </p>
                            </div>
                        </a>
                    </li>
                    <!-- top 1 -->
                    <li class="dropdown-item p-1 rounded">
                        <a
                                href="#"
                                class="
                    d-flex
                    align-items-center
                    text-decoration-none text-dark
                  "
                        >
                            <div class="p-2">
                                <img
                                        src="https://static.xx.fbcdn.net/rsrc.php/v3/yj/r/tSXYIzZlfrS.png"
                                        alt="from fb"
                                        class="rounded-circle"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                            </div>
                            <div>
                                <p class="m-0">Friends</p>
                            </div>
                        </a>
                    </li>
                    <!-- top 2 -->
                    <li class="dropdown-item p-1 rounded">
                        <a
                                href="#"
                                class="
                    d-flex
                    align-items-center
                    text-decoration-none text-dark
                  "
                        >
                            <div class="p-2">
                                <img
                                        src="https://static.xx.fbcdn.net/rsrc.php/v3/yj/r/Im_0d7HFH4n.png"
                                        alt="from fb"
                                        class="rounded-circle"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                            </div>
                            <div>
                                <p class="m-0">Groups</p>
                                <i
                                        class="fas fa-circle text-primary"
                                        style="font-size: 0.5rem !important"
                                ></i>
                                <span class="fs-7 text-primary"> 1 new</span>
                            </div>
                        </a>
                    </li>
                    <!-- top 3 -->
                    <li class="dropdown-item p-1">
                        <a
                                href="#"
                                class="
                    d-flex
                    align-items-center
                    justify-content-between
                    text-decoration-none text-dark
                  "
                        >
                            <div class="d-flex align-items-center justify-content-evenly">
                                <div class="p-2">
                                    <img
                                            src="https://static.xx.fbcdn.net/rsrc.php/v3/yj/r/0gH3vbvr8Ee.png"
                                            alt="from fb"
                                            class="rounded-circle"
                                            style="width: 38px; height: 38px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="m-0">Pages</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <!-- top 4 -->
                    <li class="dropdown-item p-1">
                        <a
                                href="#"
                                class="
                    d-flex
                    align-items-center
                    justify-content-between
                    text-decoration-none text-dark
                  "
                        >
                            <div class="d-flex align-items-center justify-content-evenly">
                                <div class="p-2">
                                    <img
                                            src="https://static.xx.fbcdn.net/rsrc.php/v3/y4/r/MN44Sm-CTHN.png"
                                            alt="from fb"
                                            class="rounded-circle"
                                            style="width: 38px; height: 38px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="m-0">Marketplace</p>
                                </div>
                            </div>
                        </a>
                    </li>
                    <!-- top 5 -->
                    <li class="dropdown-item p-1">
                        <a
                                href="#"
                                class="
                    d-flex
                    align-items-center
                    justify-content-between
                    text-decoration-none text-dark
                  "
                        >
                            <div class="d-flex align-items-center justify-content-evenly">
                                <div class="p-2">
                                    <img
                                            src="https://static.xx.fbcdn.net/rsrc.php/v3/y-/r/FhOLTyUFKwf.png"
                                            alt="from fb"
                                            class="rounded-circle"
                                            style="width: 38px; height: 38px; object-fit: cover"
                                    />
                                </div>
                                <div>
                                    <p class="m-0">Watch</p>
                                    <i
                                            class="fas fa-circle text-primary"
                                            style="font-size: 0.5rem !important"
                                    ></i>
                                    <span class="fs-7 text-primary"> 9+ new videos</span>
                                </div>
                            </div>
                        </a>
                    </li>
                    <!-- see more -->
                    <li class="p-1" type="button">
                        <div id="accordionFlushExample">
                            <div>
                                <!-- see more button -->
                                <div
                                        class="d-flex align-items-center"
                                        data-bs-toggle="collapse"
                                        data-bs-target="#flush-collapseOne"
                                        aria-expanded="false"
                                        aria-controls="flush-collapseOne"
                                >
                                    <div class="p-2">
                                        <i
                                                class="fas fa-chevron-down rounded-circle p-2"
                                                style="background-color: #d5d5d5 !important"
                                        ></i>
                                    </div>
                                    <div>
                                        <p class="m-0">See More</p>
                                    </div>
                                </div>
                                <!-- content -->
                                <div
                                        id="flush-collapseOne"
                                        class="accordion-collapse collapse"
                                        aria-labelledby="flush-headingOne"
                                        data-bs-parent="#accordionFlushExample"
                                >
                                    <div>
                                        <!-- item 1 -->
                                        <div
                                                class="
                            d-flex
                            align-items-center
                            dropdown-item
                            p-0
                            m-0
                          "
                                        >
                                            <div class="p-2">
                                                <img
                                                        src="https://static.xx.fbcdn.net/rsrc.php/v3/yj/r/Y7r38CcFEw5.png"
                                                        alt="from fb"
                                                        class="rounded-circle"
                                                        style="
                                width: 38px;
                                height: 38px;
                                object-fit: cover;
                              "
                                                />
                                            </div>
                                            <div>
                                                <p class="m-0">Campus</p>
                                            </div>
                                        </div>
                                        <!-- item 2 -->
                                        <div
                                                class="
                            d-flex
                            align-items-center
                            dropdown-item
                            p-0
                            m-0
                          "
                                        >
                                            <div class="p-2">
                                                <img
                                                        src="https://static.xx.fbcdn.net/rsrc.php/v3/yx/r/N7UOh8REweU.png"
                                                        alt="from fb"
                                                        class="rounded-circle"
                                                        style="
                                width: 38px;
                                height: 38px;
                                object-fit: cover;
                              "
                                                />
                                            </div>
                                            <div>
                                                <p class="m-0">Events</p>
                                            </div>
                                        </div>
                                        <!-- item 3 -->
                                        <div
                                                class="
                            d-flex
                            align-items-center
                            dropdown-item
                            p-0
                            m-0
                          "
                                        >
                                            <div class="p-2">
                                                <img
                                                        src="https://static.xx.fbcdn.net/rsrc.php/v3/yo/r/hLkEFzsCyXC.png"
                                                        alt="from fb"
                                                        class="rounded-circle"
                                                        style="
                                width: 38px;
                                height: 38px;
                                object-fit: cover;
                              "
                                                />
                                            </div>
                                            <div>
                                                <p class="m-0">Newsfeed</p>
                                            </div>
                                        </div>
                                        <!-- end -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <hr class="m-0"/>
                    <!-- shortcuts -->
                    <!-- heading -->
                    <div
                            class="
                  d-flex
                  justify-content-between
                  align-items-center
                  mt-2
                  text-muted
                  edit-heading
                "
                    >
                        <h4 class="m-0 pointer">Your Shorcuts</h4>
                        <p
                                class="m-0 text-primary me-3 pointer edit-button"
                                type="button"
                                data-bs-toggle="modal"
                                data-bs-target="#shortCutModal"
                        >
                            Edit
                        </p>
                        <!-- modal -->
                        <div
                                class="modal fade"
                                id="shortCutModal"
                                tabindex="-1"
                                aria-labelledby="shortCutModalLabel"
                                aria-hidden="true"
                                data-bs-backdrop="false"
                        >
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <!-- head -->
                                    <div class="modal-header align-items-center">
                                        <h5
                                                class="text-dark text-center w-100 m-0"
                                                id="exampleModalLabel"
                                        >
                                            Edit Your ShortCuts
                                        </h5>
                                        <button
                                                type="button"
                                                class="btn-close"
                                                data-bs-dismiss="modal"
                                                aria-label="Close"
                                        ></button>
                                    </div>
                                    <!-- body -->
                                    <div class="modal-body">
                                        <p class="text-muted">
                                            Shortcuts provide quick access to what you do most on
                                            Facebook. Your Shortcuts are sorted automatically, but
                                            you can pin something so it's always shown at the top
                                            or hide it from the list.
                                        </p>
                                        <!-- Search -->
                                        <div class="p-1">
                                            <div
                                                    class="
                              input-group-text
                              bg-gray
                              border-0
                              rounded-pill
                            "
                                                    style="min-height: 40px; min-width: 230px"
                                            >
                                                <i class="fas fa-search me-2 text-muted"></i>
                                                <input
                                                        type="text"
                                                        class="form-control rounded-pill border-0 bg-gray"
                                                        placeholder="Search your Pages, groups, games, and events"
                                                />
                                            </div>
                                        </div>
                                        <!-- short-1 -->
                                        <li class="my-1 p-1">
                                            <div
                                                    class="
                              d-flex
                              align-items-center
                              justify-content-between
                              text-decoration-none text-dark
                            "
                                            >
                                                <div
                                                        class="
                                d-flex
                                align-items-center
                                justify-content-evenly
                              "
                                                >
                                                    <div class="p-2">
                                                        <img
                                                                src="https://source.unsplash.com/random/1"
                                                                alt="from fb"
                                                                class="
                                    rounded
                                    border border-1 border-secondary
                                  "
                                                                style="
                                    width: 38px;
                                    height: 38px;
                                    object-fit: cover;
                                  "
                                                        />
                                                    </div>
                                                    <div>
                                                        <p class="m-0">Lorem Ipsum</p>
                                                    </div>
                                                </div>
                                                <select
                                                        class="form-select w-50 border-0 bg-gray"
                                                        aria-label="Default select example"
                                                >
                                                    <option selected value="1">
                                                        Short Automatically
                                                    </option>
                                                    <option value="2">Pin To Top</option>
                                                    <option value="3">Hide</option>
                                                </select>
                                            </div>
                                        </li>
                                        <!-- short-2 -->
                                        <li class="my-1 p-1">
                                            <div
                                                    class="
                              d-flex
                              align-items-center
                              justify-content-between
                              text-decoration-none text-dark
                            "
                                            >
                                                <div
                                                        class="
                                d-flex
                                align-items-center
                                justify-content-evenly
                              "
                                                >
                                                    <div class="p-2">
                                                        <img
                                                                src="https://source.unsplash.com/random/2"
                                                                alt="from fb"
                                                                class="
                                    rounded
                                    border border-1 border-secondary
                                  "
                                                                style="
                                    width: 38px;
                                    height: 38px;
                                    object-fit: cover;
                                  "
                                                        />
                                                    </div>
                                                    <div>
                                                        <p class="m-0">Lorem Ipsum</p>
                                                    </div>
                                                </div>
                                                <select
                                                        class="form-select w-50 border-0 bg-gray"
                                                        aria-label="Default select example"
                                                >
                                                    <option selected value="1">
                                                        Short Automatically
                                                    </option>
                                                    <option value="2">Pin To Top</option>
                                                    <option value="3">Hide</option>
                                                </select>
                                            </div>
                                        </li>
                                        <!-- short-3 -->
                                        <li class="my-1 p-1">
                                            <div
                                                    class="
                              d-flex
                              align-items-center
                              justify-content-between
                              text-decoration-none text-dark
                            "
                                            >
                                                <div
                                                        class="
                                d-flex
                                align-items-center
                                justify-content-evenly
                              "
                                                >
                                                    <div class="p-2">
                                                        <img
                                                                src="https://source.unsplash.com/random/3"
                                                                alt="from fb"
                                                                class="
                                    rounded
                                    border border-1 border-secondary
                                  "
                                                                style="
                                    width: 38px;
                                    height: 38px;
                                    object-fit: cover;
                                  "
                                                        />
                                                    </div>
                                                    <div>
                                                        <p class="m-0">Lorem Ipsum</p>
                                                    </div>
                                                </div>
                                                <select
                                                        class="form-select w-50 border-0 bg-gray"
                                                        aria-label="Default select example"
                                                >
                                                    <option selected value="1">
                                                        Short Automatically
                                                    </option>
                                                    <option value="2">Pin To Top</option>
                                                    <option value="3">Hide</option>
                                                </select>
                                            </div>
                                        </li>
                                        <!-- end -->
                                    </div>
                                    <!-- footer -->
                                    <div class="modal-footer">
                                        <button
                                                type="button"
                                                class="btn btn-light text-primary"
                                                data-bs-dismiss="modal"
                                        >
                                            Close
                                        </button>
                                        <button type="button" class="btn btn-primary">
                                            Save changes
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end -->
                    </div>
                    <!-- short 1 -->
                    <li class="dropdown-item p-1">
                        <a
                                href="#"
                                class="
                    d-flex
                    align-items-center
                    text-decoration-none text-dark
                  "
                        >
                            <div class="p-2">
                                <img
                                        src="https://source.unsplash.com/random/1"
                                        alt="from fb"
                                        class="rounded border border-1 border-secondary"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                            </div>
                            <div>
                                <p class="m-0">Lorem Ipsum</p>
                            </div>
                        </a>
                    </li>
                    <!-- short-2 -->
                    <li class="dropdown-item p-1">
                        <a
                                href=""
                                class="
                    d-flex
                    align-items-center
                    text-decoration-none text-dark
                  "
                        >
                            <div class="p-2">
                                <img
                                        src="https://source.unsplash.com/random/2"
                                        alt="from fb"
                                        class="rounded border border-1 border-secondary"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                            </div>
                            <div>
                                <p class="m-0">Lorem Ipsum</p>
                            </div>
                        </a>
                    </li>
                    <!-- short-3 -->
                    <li class="dropdown-item p-1">
                        <a
                                href=""
                                class="
                    d-flex
                    align-items-center
                    text-decoration-none text-dark
                  "
                        >
                            <div class="p-2">
                                <img
                                        src="https://source.unsplash.com/random/3"
                                        alt="from fb"
                                        class="rounded border border-1 border-secondary"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                            </div>
                            <div>
                                <p class="m-0">Lorem Ipsum</p>
                            </div>
                        </a>
                    </li>
                    <!-- see more -->
                    <li class="p-1" type="button">
                        <div id="accordionFlushExample">
                            <div>
                                <!-- see more button -->
                                <div
                                        class="d-flex align-items-center"
                                        data-bs-toggle="collapse"
                                        data-bs-target="#shortModal"
                                        aria-expanded="false"
                                        aria-controls="shortModal"
                                >
                                    <div class="p-2">
                                        <i
                                                class="fas fa-chevron-down rounded-circle p-2"
                                                style="background-color: #d5d5d5 !important"
                                        ></i>
                                    </div>
                                    <div>
                                        <p class="m-0">See More</p>
                                    </div>
                                </div>
                                <!-- content -->
                                <div
                                        id="shortModal"
                                        class="accordion-collapse collapse"
                                        aria-labelledby="flush-headingOne"
                                        data-bs-parent="#accordionFlushExample"
                                >
                                    <div>
                                        <!-- item 1 -->
                                        <div
                                                class="
                            d-flex
                            align-items-center
                            dropdown-item
                            p-0
                            m-0
                          "
                                        >
                                            <div class="p-2">
                                                <img
                                                        src="https://source.unsplash.com/random/4"
                                                        alt="from fb"
                                                        class="rounded border border-1 border-secondary"
                                                        style="
                                width: 38px;
                                height: 38px;
                                object-fit: cover;
                              "
                                                />
                                            </div>
                                            <div>
                                                <p class="m-0">Campus</p>
                                            </div>
                                        </div>
                                        <!-- item 2 -->
                                        <div
                                                class="
                            d-flex
                            align-items-center
                            dropdown-item
                            p-0
                            m-0
                          "
                                        >
                                            <div class="p-2">
                                                <img
                                                        src="https://source.unsplash.com/random/5"
                                                        alt="from fb"
                                                        class="rounded border border-1 border-secondary"
                                                        style="
                                width: 38px;
                                height: 38px;
                                object-fit: cover;
                              "
                                                />
                                            </div>
                                            <div>
                                                <p class="m-0">Events</p>
                                            </div>
                                        </div>
                                        <!-- item 3 -->
                                        <div
                                                class="
                            d-flex
                            align-items-center
                            dropdown-item
                            p-0
                            m-0
                          "
                                        >
                                            <div class="p-2">
                                                <img
                                                        src="https://source.unsplash.com/random/6"
                                                        alt="from fb"
                                                        class="rounded border border-1 border-secondary"
                                                        style="
                                width: 38px;
                                height: 38px;
                                object-fit: cover;
                              "
                                                />
                                            </div>
                                            <div>
                                                <p class="m-0">Newsfeed</p>
                                            </div>
                                        </div>
                                        <!-- end -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <!-- terms -->
                <div class="p-2 mt-5">
                    <p class="text-muted fs-7">
                        Privacy &#8226; Terms &#8226; Advertising &#8226; Ad Choices
                        &#8226; Cookies &#8226; Flexbook © 2022
                    </p>
                </div>
            </div>
        </div>
        <!-- ================= Timeline ================= -->
        <div class="col-12 col-lg-6 pb-5">
            <div
                    class="d-flex flex-column justify-content-center w-100 mx-auto"
                    style="padding-top: 56px; max-width: 680px"
            >
                <!-- stories -->

                <!-- create post -->
                <div class="bg-white p-3 mt-3 rounded border shadow">
                    <!-- avatar -->
                    <div class="d-flex" type="button">
                        <div class="p-1">
                            <img
                                    src="https://source.unsplash.com/collection/happy-people"
                                    alt="avatar"
                                    class="rounded-circle me-2"
                                    style="width: 38px; height: 38px; object-fit: cover"
                            />
                        </div>
                        <input
                                type="text"
                                class="form-control rounded-pill border-0 bg-gray pointer"
                                disabled
                                placeholder="What's on your mind, <%=user.getFirstname()%>?"
                                data-bs-toggle="modal"
                                data-bs-target="#createModal"
                        />
                    </div>
                    <!-- create modal -->
                    <div
                            class="modal fade"
                            id="createModal"
                            tabindex="-1"
                            aria-labelledby="createModalLabel"
                            aria-hidden="true"
                            data-bs-backdrop="false"
                    >
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <!-- head -->
                                <div class="modal-header align-items-center">
                                    <h5
                                            class="text-dark text-center w-100 m-0"
                                            id="exampleModalLabel"
                                    >
                                        Create Post
                                    </h5>
                                    <button
                                            type="button"
                                            class="btn-close"
                                            data-bs-dismiss="modal"
                                            aria-label="Close"
                                    ></button>
                                </div>
                                <!-- body -->
                                <div class="modal-body">
                                    <div class="my-1 p-1">
                                        <div class="d-flex flex-column">
                                            <!-- name -->
                                            <div class="d-flex align-items-center">
                                                <div class="p-2">
                                                    <img
                                                            src="https://source.unsplash.com/collection/happy-people"
                                                            alt="from fb"
                                                            class="rounded-circle"
                                                            style="
                                  width: 38px;
                                  height: 38px;
                                  object-fit: cover;
                                "
                                                    />
                                                </div>
                                                <div>
                                                    <p class="m-0 fw-bold"><%=user.getFirstname()%>
                                                    </p>
                                                </div>
                                            </div>
                                            <!-- text -->
                                            <div>
                                                <div class="postArea">
                                                    <form action="PostServlet" method="POST"
                                                          enctype="multipart/form-data">
                                                        <div class="mb-3">
                                                            <label for="post-title" class="form-label">Title</label>
                                                            <input
                                                                    type="text"
                                                                    name="title"
                                                                    class="form-control"
                                                                    id="post-title"
                                                                    placeholder="Post Title"
                                                                    required
                                                            />
                                                        </div>
                                                        <div class="mb-2">
                                                        <textarea
                                                                style="border-radius: 30px"
                                                                name="body"
                                                                id="post"
                                                                cols="30"
                                                                rows="2"
                                                                class="form-control"
                                                                aria-describedby="emailHelp"
                                                                placeholder="Whats on your mind <%=user.getLastname()%>"
                                                                required
                                                        ></textarea>
                                                        </div>
                                                        <div class="row post-buttons mb-4">
                                                            <div class="col-md-6 col-btn">
                                                                <label class="form-label" for="customFile">Photo</label>
                                                                <input type="file" name="file" class="form-control"
                                                                       id="customFile" required/>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-primary w-100">
                                                                    Post
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>


                                            </div>
                                            <!-- emoji  -->

                                            <!-- options -->
                                            <div
                                                    class="
                              d-flex
                              justify-content-between
                              border border-1 border-light
                              rounded
                              p-3
                              mt-3
                            "
                                            >

                                                <div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- end -->
                                </div>


                                <!-- footer -->
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <!-- actions -->
                    <div class="d-flex flex-column flex-lg-row mt-3">
                        <!-- a 1 -->
                        <div
                                class="
                    dropdown-item
                    rounded
                    d-flex
                    align-items-center
                    justify-content-center
                  "
                                type="button"
                        >
                            <i class="fas fa-video me-2 text-danger"></i>
                            <p class="m-0 text-muted">Live Video</p>
                        </div>
                        <!-- a 2 -->
                        <div
                                class="
                    dropdown-item
                    rounded
                    d-flex
                    align-items-center
                    justify-content-center
                  "
                                type="button"
                        >
                            <i class="fas fa-photo-video me-2 text-success"></i>
                            <p class="m-0 text-muted">Photo/Video</p>
                        </div>
                        <!-- a 3 -->
                        <div
                                class="
                    dropdown-item
                    rounded
                    d-flex
                    align-items-center
                    justify-content-center
                  "
                                type="button"
                        >
                            <i class="fas fa-smile me-2 text-warning"></i>
                            <p class="m-0 text-muted">Feeling/Activity</p>
                        </div>
                    </div>
                </div>
                <!-- posts -->
                <!-- p 1 -->
                <div class="bg-white p-4 rounded shadow mt-3">
                    <div class="scroller like-icon">
                        <%
                            for (Post post : posts) {%>

                        <div class="linear">
                            <div class="titleText">

                                <p><span style="font-weight: bold; color:#81adef; font-size: 1.4em; margin-right: 5px">Author:</span>
                                    <%=post.getName()%>
                                </p>
                                <h2><%=post.getTitle()%>
                                </h2>
                            </div>
                            <img src="./image/<%=post.getImageName()%>"  class="majorpix" alt="Post Image"/>
                        </div>
                        <div class="body">
                            <p><%=post.getBody()%>
                            </p>
                        </div>
                        <hr>
                        <div class="comment_like_share mb-2">
                            <div class="like">
                                <i onclick="like(<%=post.getId()%>, <%=user.getId()%>)" id="<%=post.getId()%>"
                                   class="fa fa-thumbs-o-up" aria-hidden="true">
                                    <span class="likes"><%=post.getNoLikes()%></span>
                                    <span style="display:none;" class="thumb"><%=post.getId()%></span> </i>
                                <p style="display: none" class="userLiked"><%=post.isLikedPost()%>
                                </
                                <!-- <span>Like</span> -->
                            </div>
                            <div class="comment">
                                <i class="fa fa-commenting-o" aria-hidden="true" onclick="com(<%=post.getId()%>)"></i>
                                <span style="font-size: 30px;"><%=post.getNoComments()%>
                                    <!-- <span>Comment</span> -->
                            </div>
                            <div class="edit">
                                <i class="fa fa-edit" aria-hidden="true" onclick="edit(<%=post.getId()%>
                                    <% session.setAttribute("postToEdit",post.getId());%>)">
                                </i>
                                <!-- <span>Edit</span> -->
                            </div>
                            <div class="delete">
                                <i class="fa fa-remove" aria-hidden="true" id="delete"
                                   onclick="del(<%=post.getId()%>)"></i>
                                <!-- <span>Delete</span> -->
                            </div>
                        </div>

                        <div class="row mb-2">
                            <form action="CommentServlet" method="POST">
                                <input style="display:none" name="postId" value="<%=post.getId()%>"/>
                                <textarea
                                        name="comment"
                                        class="form-control drag"
                                        placeholder="What's your comment on this <%=user.getFirstname()%> ?"
                                ></textarea>
                                <button type="submit" class="btn btn-primary btn-md mt-3 btn-block">
                                    Comment
                                </button>
                            </form>
                        </div>
                        <%
                            }
                        %>
                    </div>

                </div>
            </div>
        </div>
        <!-- ================= Chatbar ================= -->
        <div class="col-12 col-lg-3">
            <div
                    class="
              d-none d-xxl-block
              h-100
              fixed-top
              end-0
              overflow-hidden
              scrollbar
            "
                    style="
              max-width: 360px;
              width: 100%;
              z-index: 4;
              padding-top: 56px;
              left: initial !important;
            "
            >
                <div class="p-3 mt-4">
                    <!-- sponsors -->
                    <h5 class="text-muted">Sponsored</h5>
                    <!-- s 1 -->
                    <li class="dropdown-item my-2 d-flex justify-content-between">
                        <!-- img -->
                        <a
                                href="#"
                                class="
                    d-flex
                    align-items-center
                    text-decoration-none
                    link-dark
                  "
                        >
                            <img
                                    src="https://source.unsplash.com/random/1"
                                    alt="ads"
                                    style="width: 100px; height: 100px; object-fit: cover"
                                    class="rounded me-3"
                            />
                            <div>
                                <p class="m-0">Lorem ipsum</p>
                                <span class="text-muted fs-7">loremipsum.com</span>
                            </div>
                        </a>
                        <!-- icon -->
                        <div
                                class="
                    rounded-circle
                    p-1
                    bg-white
                    d-flex
                    align-items-center
                    justify-content-center
                    mx-2
                    sponsor-icon
                    nav-item
                  "
                                type="button"
                                style="width: 38px; height: 38px"
                        >
                            <i
                                    class="fas fa-ellipsis-h text-muted p-2"
                                    data-bs-toggle="dropdown"
                            ></i>
                            <!-- menu -->
                            <ul class="dropdown-menu">
                                <!-- item 1 -->
                                <li class="dropdown-item">
                                    <a
                                            href="#"
                                            class="
                          d-flex
                          align-items-center
                          text-decoration-none text-dark
                        "
                                    >
                                        <i class="far fa-window-close"></i>
                                        <div class="ms-3">
                                            <p class="m-0">Hide Ad</p>
                                            <span class="text-muted fs-7"
                                            >Never see this add again.</span
                                            >
                                        </div>
                                    </a>
                                </li>
                                <!-- item 2 -->
                                <li class="dropdown-item">
                                    <a
                                            href="#"
                                            class="
                          d-flex
                          align-items-center
                          text-decoration-none text-dark
                        "
                                    >
                                        <i class="fas fa-exclamation-triangle"></i>
                                        <div class="ms-3">
                                            <p class="m-0">Report Ad</p>
                                            <span class="text-muted fs-7"
                                            >Tell us a problem with this add.</span
                                            >
                                        </div>
                                    </a>
                                </li>
                                <!-- item 3 -->
                                <li class="dropdown-item">
                                    <a
                                            href="#"
                                            class="
                          d-flex
                          align-items-center
                          text-decoration-none text-dark
                        "
                                    >
                                        <i class="fas fa-info-circle"></i>
                                        <div class="ms-3">
                                            <p class="m-0">Why am I seeing this ad?</p>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <!-- s 2 -->
                    <li class="dropdown-item my-2 d-flex justify-content-between">
                        <!-- img -->
                        <a
                                href="#"
                                class="
                    d-flex
                    align-items-center
                    text-decoration-none
                    link-dark
                  "
                        >
                            <img
                                    src="https://source.unsplash.com/random/2"
                                    alt="ads"
                                    style="width: 100px; height: 100px; object-fit: cover"
                                    class="rounded me-3"
                            />
                            <div>
                                <p class="m-0">Lorem ipsum</p>
                                <span class="text-muted fs-7">loremipsum.com</span>
                            </div>
                        </a>
                        <!-- icon -->
                        <div
                                class="
                    rounded-circle
                    p-1
                    bg-white
                    d-flex
                    align-items-center
                    justify-content-center
                    mx-2
                    sponsor-icon
                    nav-item
                  "
                                type="button"
                                style="width: 38px; height: 38px"
                        >
                            <i
                                    class="fas fa-ellipsis-h text-muted p-2"
                                    data-bs-toggle="dropdown"
                            ></i>
                            <!-- menu -->
                            <ul class="dropdown-menu">
                                <!-- item 1 -->
                                <li class="dropdown-item">
                                    <a
                                            href="#"
                                            class="
                          d-flex
                          align-items-center
                          text-decoration-none text-dark
                        "
                                    >
                                        <i class="far fa-window-close"></i>
                                        <div class="ms-3">
                                            <p class="m-0">Hide Ad</p>
                                            <span class="text-muted fs-7"
                                            >Never see this add again.</span
                                            >
                                        </div>
                                    </a>
                                </li>
                                <!-- item 2 -->
                                <li class="dropdown-item">
                                    <a
                                            href="#"
                                            class="
                          d-flex
                          align-items-center
                          text-decoration-none text-dark
                        "
                                    >
                                        <i class="fas fa-exclamation-triangle"></i>
                                        <div class="ms-3">
                                            <p class="m-0">Report Ad</p>
                                            <span class="text-muted fs-7"
                                            >Tell us a problem with this add.</span
                                            >
                                        </div>
                                    </a>
                                </li>
                                <!-- item 3 -->
                                <li class="dropdown-item">
                                    <a
                                            href="#"
                                            class="
                          d-flex
                          align-items-center
                          text-decoration-none text-dark
                        "
                                    >
                                        <i class="fas fa-info-circle"></i>
                                        <div class="ms-3">
                                            <p class="m-0">Why am I seeing this ad?</p>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <!-- contacts -->
                    <hr class="m-0"/>
                    <div
                            class="my-3 d-flex justify-content-between align-items-center"
                    >
                        <p class="text-muted fs-5 m-0">Contacts</p>
                        <!-- icons -->
                        <div class="text-muted">
                            <!-- video room -->
                            <i
                                    class="fas fa-video mx-2 pointer"
                                    type="button"
                                    data-bs-toggle="modal"
                                    data-bs-target="#videoRoomD"
                            ></i>
                            <!-- video room modal -->
                            <div
                                    class="modal fade"
                                    id="videoRoomD"
                                    tabindex="-1"
                                    aria-labelledby="videoRoomDLabel"
                                    aria-hidden="true"
                                    data-bs-backdrop="false"
                            >
                                <div class="modal-dialog modal-dialog-centered modal-lg">
                                    <div class="modal-content bg-dark">
                                        <!-- header -->
                                        <div class="modal-header border-0">
                                            <button
                                                    type="button"
                                                    class="btn-close btn-close-white"
                                                    data-bs-dismiss="modal"
                                                    aria-label="Close"
                                            ></button>
                                        </div>
                                        <!-- body -->
                                        <div
                                                class="
                            modal-body
                            d-flex
                            flex-column
                            align-items-center
                            justify-content-center
                          "
                                                style="min-height: 400px"
                                        >
                                            <i class="fas fa-video fs-0"></i>
                                            <h3 class="text-white">Schedule A Room For Later</h3>
                                            <p class="text-white text-center w-50 mx-auto">
                                                Lorem ipsum dolor sit amet consectetur adipisicing
                                                elit. Ut deserunt alias laudantium itaque eius enim
                                                natus culpa eligendi consectetur maiores!
                                            </p>
                                            <button class="btn btn-lg btn-primary rounded-pill">
                                                Schedule Room
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- new chat -->
                            <i
                                    class="fas fa-search mx-2 pointer"
                                    type="button"
                                    data-bs-toggle="modal"
                                    data-bs-target="#newChat"
                            ></i>
                            <!-- chat settings -->
                            <i
                                    class="fas fa-ellipsis-h pointer text-muted mx-2"
                                    type="button"
                                    data-bs-toggle="dropdown"
                            ></i>
                            <!-- chat setting dd -->
                            <ul class="dropdown-menu shadow" style="width: 18em">
                                <!-- title -->
                                <div class="p-2">
                                    <h5>Chat Settings</h5>
                                    <span class="text-muted fs-7"
                                    >Customize your Messenger experience.</span
                                    >
                                </div>
                                <hr/>
                                <!-- incoming sound -->
                                <li>
                                    <div
                                            class="
                          dropdown-item
                          d-flex
                          align-items-center
                          justify-content-between
                        "
                                    >
                                        <!-- icon -->
                                        <div class="d-flex align-items-center">
                                            <i class="fas fa-phone-alt me-3"></i>
                                            <p class="m-0">Incoming call sounds</p>
                                        </div>
                                        <!-- toggle -->
                                        <div class="form-check form-switch m-0">
                                            <input
                                                    class="form-check-input"
                                                    type="checkbox"
                                                    id="flexSwitchCheckChecked"
                                                    checked
                                            />
                                            <label
                                                    class="form-check-label"
                                                    for="flexSwitchCheckChecked"
                                            ></label>
                                        </div>
                                    </div>
                                </li>
                                <!-- message sound -->
                                <li>
                                    <div
                                            class="
                          dropdown-item
                          d-flex
                          align-items-center
                          justify-content-between
                        "
                                    >
                                        <!-- icon -->
                                        <div class="d-flex align-items-center">
                                            <i class="fas fa-volume-off me-4 fs-4"></i>
                                            <p class="m-0">Message sounds</p>
                                        </div>
                                        <!-- toggle -->
                                        <div class="form-check form-switch m-0">
                                            <input
                                                    class="form-check-input"
                                                    type="checkbox"
                                                    id="flexSwitchCheckChecked"
                                                    checked
                                            />
                                            <label
                                                    class="form-check-label"
                                                    for="flexSwitchCheckChecked"
                                            ></label>
                                        </div>
                                    </div>
                                </li>
                                <!-- popup message -->
                                <li>
                                    <div
                                            class="
                          dropdown-item
                          d-flex
                          align-items-center
                          justify-content-between
                        "
                                    >
                                        <!-- icon -->
                                        <div class="d-flex align-items-center">
                                            <i class="fas fa-spinner me-3"></i>
                                            <p class="m-0">Pop-up new messages</p>
                                        </div>
                                        <!-- toggle -->
                                        <div class="form-check form-switch m-0">
                                            <input
                                                    class="form-check-input"
                                                    type="checkbox"
                                                    id="flexSwitchCheckChecked"
                                                    checked
                                            />
                                            <label
                                                    class="form-check-label"
                                                    for="flexSwitchCheckChecked"
                                            ></label>
                                        </div>
                                    </div>
                                    <span class="ms-5 text-muted fs-7"
                                    >Automatically open new messages.</span
                                    >
                                </li>
                                <hr class="m-0"/>
                                <!-- item 1 -->
                                <li>
                                    <div
                                            class="
                          dropdown-item
                          d-flex
                          align-items-center
                          justify-content-between
                        "
                                    >
                                        <!-- icon -->
                                        <div class="d-flex align-items-center">
                                            <i class="fas fa-toggle-off me-3"></i>
                                            <p class="m-0">Turn Off Active Status</p>
                                        </div>
                                    </div>
                                </li>
                                <!-- item 2 -->
                                <li>
                                    <div
                                            class="
                          dropdown-item
                          d-flex
                          align-items-center
                          justify-content-between
                        "
                                    >
                                        <!-- icon -->
                                        <div class="d-flex align-items-center">
                                            <i class="far fa-comment-alt me-3"></i>
                                            <p class="m-0">Message Request</p>
                                        </div>
                                    </div>
                                </li>
                                <!-- item 3 -->
                                <li>
                                    <div
                                            class="
                          dropdown-item
                          d-flex
                          align-items-center
                          justify-content-between
                        "
                                    >
                                        <!-- icon -->
                                        <div class="d-flex align-items-center">
                                            <i class="fas fa-share-square me-3"></i>
                                            <p class="m-0">Message delivery settings</p>
                                        </div>
                                    </div>
                                </li>
                                <!-- item 4 -->
                                <li>
                                    <div
                                            class="
                          dropdown-item
                          d-flex
                          align-items-center
                          justify-content-between
                        "
                                    >
                                        <!-- icon -->
                                        <div class="d-flex align-items-center">
                                            <i class="fas fa-shield-alt me-3"></i>
                                            <p class="m-0">Block settings</p>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- friend 1 -->
                    <li
                            class="dropdown-item rounded my-2 px-0"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#singleChat1"
                    >
                        <!-- avatar -->
                        <div
                                class="d-flex align-items-center mx-2 chat-avatar"
                                data-bs-custom-class="chat-box"
                                data-bs-container="body"
                                data-bs-toggle="popover"
                                data-bs-placement="left"
                                data-bs-trigger="hover"
                                data-bs-content='
                    <div>
                      <div class="popover-body d-flex p-2">
                        <div>
                          <img src="https://source.unsplash.com/random/4" alt="avatar" class="pop-avatar"  />
                        </div>
                        <div >
                          <h5>Mike</h5>
                          <div class="d-flex">
                            <i class="fas fa-user-friends m-1 text-muted"></i>
                            <p>2 mutual friends: <span class="fw-bold">Jerry</span> and <span class="fw-bold">Phu</span></p>
                          </div>
                          <div class="d-flex">
                          <i class="fas fa-graduation-cap m-1 text-muted"></i>
                          <p>Studies at MIT</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  '
                                data-bs-html="true"
                        >
                            <div class="position-relative">
                                <img
                                        src="https://source.unsplash.com/random/4"
                                        alt="avatar"
                                        class="rounded-circle me-2"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                                <span
                                        class="
                        position-absolute
                        bottom-0
                        translate-middle
                        border border-light
                        rounded-circle
                        bg-success
                        p-1
                      "
                                        style="left: 75%"
                                >
                      <span class="visually-hidden"></span>
                    </span>
                            </div>
                            <p class="m-0">Mike</p>
                        </div>
                    </li>
                    <!-- friend 2 -->
                    <li
                            class="dropdown-item rounded my-2 px-0"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#singleChat2"
                    >
                        <!-- avatar -->
                        <div
                                class="d-flex align-items-center mx-2 chat-avatar"
                                data-bs-custom-class="chat-box"
                                data-bs-container="body"
                                data-bs-toggle="popover"
                                data-bs-placement="left"
                                data-bs-trigger="hover"
                                data-bs-content='
                          <div>
                            <div class="popover-body d-flex p-2">
                              <div>
                                <img src="https://source.unsplash.com/random/2" alt="avatar" class="pop-avatar"  />
                              </div>
                              <div >
                                <h5>Tuan</h5>
                                <div class="d-flex">
                                  <i class="fas fa-user-friends m-1 text-muted"></i>
                                  <p>2 mutual friends: <span class="fw-bold">Jerry</span> and <span class="fw-bold">Phu</span></p>
                                </div>
                                <div class="d-flex">
                                <i class="fas fa-graduation-cap m-1 text-muted"></i>
                                <p>Studies at MIT</p>
                                </div>
                              </div>
                            </div>
                          </div>
                        '
                                data-bs-html="true"
                        >
                            <div class="position-relative">
                                <img
                                        src="https://source.unsplash.com/random/2"
                                        alt="avatar"
                                        class="rounded-circle me-2"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                                <span
                                        class="
                        position-absolute
                        bottom-0
                        translate-middle
                        border border-light
                        rounded-circle
                        bg-success
                        p-1
                      "
                                        style="left: 75%"
                                >
                      <span class="visually-hidden"></span>
                    </span>
                            </div>
                            <p class="m-0">Tuan</p>
                        </div>
                    </li>
                    <!-- friend 3 -->
                    <li
                            class="dropdown-item rounded my-2 px-0"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#singleChat3"
                    >
                        <!-- avatar -->
                        <div
                                class="d-flex align-items-center mx-2 chat-avatar"
                                data-bs-custom-class="chat-box"
                                data-bs-container="body"
                                data-bs-toggle="popover"
                                data-bs-placement="left"
                                data-bs-trigger="hover"
                                data-bs-content='
                              <div>
                                <div class="popover-body d-flex p-2">
                                  <div>
                                    <img src="https://source.unsplash.com/random/3" alt="avatar" class="pop-avatar"  />
                                  </div>
                                  <div >
                                    <h5>Jerry</h5>
                                    <div class="d-flex">
                                      <i class="fas fa-user-friends m-1 text-muted"></i>
                                      <p>2 mutual friends: <span class="fw-bold">Jerry</span> and <span class="fw-bold">Phu</span></p>
                                    </div>
                                    <div class="d-flex">
                                    <i class="fas fa-graduation-cap m-1 text-muted"></i>
                                    <p>Studies at MIT</p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            '
                                data-bs-html="true"
                        >
                            <div class="position-relative">
                                <img
                                        src="https://source.unsplash.com/random/3"
                                        alt="avatar"
                                        class="rounded-circle me-2"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                                <span
                                        class="
                        position-absolute
                        bottom-0
                        translate-middle
                        border border-light
                        rounded-circle
                        bg-success
                        p-1
                      "
                                        style="left: 75%"
                                >
                      <span class="visually-hidden"></span>
                    </span>
                            </div>
                            <p class="m-0">Jerry</p>
                        </div>
                    </li>
                    <!-- friend 4 -->
                    <li
                            class="dropdown-item rounded my-2 px-0"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#singleChat4"
                    >
                        <!-- avatar -->
                        <div
                                class="d-flex align-items-center mx-2 chat-avatar"
                                data-bs-custom-class="chat-box"
                                data-bs-container="body"
                                data-bs-toggle="popover"
                                data-bs-placement="left"
                                data-bs-trigger="hover"
                                data-bs-content='
                          <div>
                            <div class="popover-body d-flex p-2">
                              <div>
                                <img src="https://source.unsplash.com/random/4" alt="avatar" class="pop-avatar"  />
                              </div>
                              <div >
                                <h5>Tony</h5>
                                <div class="d-flex">
                                  <i class="fas fa-user-friends m-1 text-muted"></i>
                                  <p>2 mutual friends: <span class="fw-bold">Jerry</span> and <span class="fw-bold">Phu</span></p>
                                </div>
                                <div class="d-flex">
                                <i class="fas fa-graduation-cap m-1 text-muted"></i>
                                <p>Studies at MIT</p>
                                </div>
                              </div>
                            </div>
                          </div>
                        '
                                data-bs-html="true"
                        >
                            <div class="position-relative">
                                <img
                                        src="https://source.unsplash.com/random/4"
                                        alt="avatar"
                                        class="rounded-circle me-2"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                                <span
                                        class="
                        position-absolute
                        bottom-0
                        translate-middle
                        border border-light
                        rounded-circle
                        bg-success
                        p-1
                      "
                                        style="left: 75%"
                                >
                      <span class="visually-hidden"></span>
                    </span>
                            </div>
                            <p class="m-0">Tony</p>
                        </div>
                    </li>
                    <!-- friend 5 -->
                    <li
                            class="dropdown-item rounded my-2 px-0"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#singleChat5"
                    >
                        <!-- avatar -->
                        <div
                                class="d-flex align-items-center mx-2 chat-avatar"
                                data-bs-custom-class="chat-box"
                                data-bs-container="body"
                                data-bs-toggle="popover"
                                data-bs-placement="left"
                                data-bs-trigger="hover"
                                data-bs-content='
                      <div>
                        <div class="popover-body d-flex p-2">
                          <div>
                            <img src="https://source.unsplash.com/random/5" alt="avatar" class="pop-avatar"  />
                          </div>
                          <div >
                            <h5>Phu</h5>
                            <div class="d-flex">
                              <i class="fas fa-user-friends m-1 text-muted"></i>
                              <p>2 mutual friends: <span class="fw-bold">Jerry</span> and <span class="fw-bold">Phu</span></p>
                            </div>
                            <div class="d-flex">
                            <i class="fas fa-graduation-cap m-1 text-muted"></i>
                            <p>Studies at MIT</p>
                            </div>
                          </div>
                        </div>
                      </div>
                    '
                                data-bs-html="true"
                        >
                            <div class="position-relative">
                                <img
                                        src="https://source.unsplash.com/random/5"
                                        alt="avatar"
                                        class="rounded-circle me-2"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                                <span
                                        class="
                        position-absolute
                        bottom-0
                        translate-middle
                        border border-light
                        rounded-circle
                        bg-success
                        p-1
                      "
                                        style="left: 75%"
                                >
                      <span class="visually-hidden"></span>
                    </span>
                            </div>
                            <p class="m-0">Phu</p>
                        </div>
                    </li>
                    <!-- friend 6 -->
                    <li
                            class="dropdown-item rounded my-2 px-0"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#singleChat1"
                    >
                        <!-- avatar -->
                        <div
                                class="d-flex align-items-center mx-2 chat-avatar"
                                data-bs-custom-class="chat-box"
                                data-bs-container="body"
                                data-bs-toggle="popover"
                                data-bs-placement="left"
                                data-bs-trigger="hover"
                                data-bs-content='
                                  <div>
                                    <div class="popover-body d-flex p-2">
                                      <div>
                                        <img src="https://source.unsplash.com/random/4" alt="avatar" class="pop-avatar"  />
                                      </div>
                                      <div >
                                        <h5>Mike</h5>
                                        <div class="d-flex">
                                          <i class="fas fa-user-friends m-1 text-muted"></i>
                                          <p>2 mutual friends: <span class="fw-bold">Jerry</span> and <span class="fw-bold">Phu</span></p>
                                        </div>
                                        <div class="d-flex">
                                        <i class="fas fa-graduation-cap m-1 text-muted"></i>
                                        <p>Studies at MIT</p>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                '
                                data-bs-html="true"
                        >
                            <div class="position-relative">
                                <img
                                        src="https://source.unsplash.com/random/4"
                                        alt="avatar"
                                        class="rounded-circle me-2"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                                <span
                                        class="
                        position-absolute
                        bottom-0
                        translate-middle
                        border border-light
                        rounded-circle
                        bg-success
                        p-1
                      "
                                        style="left: 75%"
                                >
                      <span class="visually-hidden"></span>
                    </span>
                            </div>
                            <p class="m-0">Mike</p>
                        </div>
                    </li>
                    <!-- friend 7 -->
                    <li
                            class="dropdown-item rounded my-2 px-0"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#singleChat2"
                    >
                        <!-- avatar -->
                        <div
                                class="d-flex align-items-center mx-2 chat-avatar"
                                data-bs-custom-class="chat-box"
                                data-bs-container="body"
                                data-bs-toggle="popover"
                                data-bs-placement="left"
                                data-bs-trigger="hover"
                                data-bs-content='
                                        <div>
                                          <div class="popover-body d-flex p-2">
                                            <div>
                                              <img src="https://source.unsplash.com/random/2" alt="avatar" class="pop-avatar"  />
                                            </div>
                                            <div >
                                              <h5>Tuan</h5>
                                              <div class="d-flex">
                                                <i class="fas fa-user-friends m-1 text-muted"></i>
                                                <p>2 mutual friends: <span class="fw-bold">Jerry</span> and <span class="fw-bold">Phu</span></p>
                                              </div>
                                              <div class="d-flex">
                                              <i class="fas fa-graduation-cap m-1 text-muted"></i>
                                              <p>Studies at MIT</p>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                      '
                                data-bs-html="true"
                        >
                            <div class="position-relative">
                                <img
                                        src="https://source.unsplash.com/random/2"
                                        alt="avatar"
                                        class="rounded-circle me-2"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                                <span
                                        class="
                        position-absolute
                        bottom-0
                        translate-middle
                        border border-light
                        rounded-circle
                        bg-success
                        p-1
                      "
                                        style="left: 75%"
                                >
                      <span class="visually-hidden"></span>
                    </span>
                            </div>
                            <p class="m-0">Tuan</p>
                        </div>
                    </li>
                    <!-- friend 8 -->
                    <li
                            class="dropdown-item rounded my-2 px-0"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#singleChat3"
                    >
                        <!-- avatar -->
                        <div
                                class="d-flex align-items-center mx-2 chat-avatar"
                                data-bs-custom-class="chat-box"
                                data-bs-container="body"
                                data-bs-toggle="popover"
                                data-bs-placement="left"
                                data-bs-trigger="hover"
                                data-bs-content='
                                            <div>
                                              <div class="popover-body d-flex p-2">
                                                <div>
                                                  <img src="https://source.unsplash.com/random/3" alt="avatar" class="pop-avatar"  />
                                                </div>
                                                <div >
                                                  <h5>Jerry</h5>
                                                  <div class="d-flex">
                                                    <i class="fas fa-user-friends m-1 text-muted"></i>
                                                    <p>2 mutual friends: <span class="fw-bold">Jerry</span> and <span class="fw-bold">Phu</span></p>
                                                  </div>
                                                  <div class="d-flex">
                                                  <i class="fas fa-graduation-cap m-1 text-muted"></i>
                                                  <p>Studies at MIT</p>
                                                  </div>
                                                </div>
                                              </div>
                                            </div>
                                          '
                                data-bs-html="true"
                        >
                            <div class="position-relative">
                                <img
                                        src="https://source.unsplash.com/random/3"
                                        alt="avatar"
                                        class="rounded-circle me-2"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                                <span
                                        class="
                        position-absolute
                        bottom-0
                        translate-middle
                        border border-light
                        rounded-circle
                        bg-success
                        p-1
                      "
                                        style="left: 75%"
                                >
                      <span class="visually-hidden"></span>
                    </span>
                            </div>
                            <p class="m-0">Jerry</p>
                        </div>
                    </li>
                    <!-- friend 9 -->
                    <li
                            class="dropdown-item rounded my-2 px-0"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#singleChat4"
                    >
                        <!-- avatar -->
                        <div
                                class="d-flex align-items-center mx-2 chat-avatar"
                                data-bs-custom-class="chat-box"
                                data-bs-container="body"
                                data-bs-toggle="popover"
                                data-bs-placement="left"
                                data-bs-trigger="hover"
                                data-bs-content='
                                        <div>
                                          <div class="popover-body d-flex p-2">
                                            <div>
                                              <img src="https://source.unsplash.com/random/4" alt="avatar" class="pop-avatar"  />
                                            </div>
                                            <div >
                                              <h5>Tony</h5>
                                              <div class="d-flex">
                                                <i class="fas fa-user-friends m-1 text-muted"></i>
                                                <p>2 mutual friends: <span class="fw-bold">Jerry</span> and <span class="fw-bold">Phu</span></p>
                                              </div>
                                              <div class="d-flex">
                                              <i class="fas fa-graduation-cap m-1 text-muted"></i>
                                              <p>Studies at MIT</p>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                      '
                                data-bs-html="true"
                        >
                            <div class="position-relative">
                                <img
                                        src="https://source.unsplash.com/random/4"
                                        alt="avatar"
                                        class="rounded-circle me-2"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                                <span
                                        class="
                        position-absolute
                        bottom-0
                        translate-middle
                        border border-light
                        rounded-circle
                        bg-success
                        p-1
                      "
                                        style="left: 75%"
                                >
                      <span class="visually-hidden"></span>
                    </span>
                            </div>
                            <p class="m-0">Tony</p>
                        </div>
                    </li>
                    <!-- friend 10 -->
                    <li
                            class="dropdown-item rounded my-2 px-0"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#singleChat5"
                    >
                        <!-- avatar -->
                        <div
                                class="d-flex align-items-center mx-2 chat-avatar"
                                data-bs-custom-class="chat-box"
                                data-bs-container="body"
                                data-bs-toggle="popover"
                                data-bs-placement="left"
                                data-bs-trigger="hover"
                                data-bs-content='
                                    <div>
                                      <div class="popover-body d-flex p-2">
                                        <div>
                                          <img src="https://source.unsplash.com/random/5" alt="avatar" class="pop-avatar"  />
                                        </div>
                                        <div >
                                          <h5>Phu</h5>
                                          <div class="d-flex">
                                            <i class="fas fa-user-friends m-1 text-muted"></i>
                                            <p>2 mutual friends: <span class="fw-bold">Jerry</span> and <span class="fw-bold">Phu</span></p>
                                          </div>
                                          <div class="d-flex">
                                          <i class="fas fa-graduation-cap m-1 text-muted"></i>
                                          <p>Studies at MIT</p>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  '
                                data-bs-html="true"
                        >
                            <div class="position-relative">
                                <img
                                        src="https://source.unsplash.com/random/5"
                                        alt="avatar"
                                        class="rounded-circle me-2"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                                <span
                                        class="
                        position-absolute
                        bottom-0
                        translate-middle
                        border border-light
                        rounded-circle
                        bg-success
                        p-1
                      "
                                        style="left: 75%"
                                >
                      <span class="visually-hidden"></span>
                    </span>
                            </div>
                            <p class="m-0">Phu</p>
                        </div>
                    </li>
                    <!-- friend 11 -->
                    <li
                            class="dropdown-item rounded my-2 px-0"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#singleChat1"
                    >
                        <!-- avatar -->
                        <div
                                class="d-flex align-items-center mx-2 chat-avatar"
                                data-bs-custom-class="chat-box"
                                data-bs-container="body"
                                data-bs-toggle="popover"
                                data-bs-placement="left"
                                data-bs-trigger="hover"
                                data-bs-content='
                    <div>
                      <div class="popover-body d-flex p-2">
                        <div>
                          <img src="https://source.unsplash.com/random/4" alt="avatar" class="pop-avatar"  />
                        </div>
                        <div >
                          <h5>Mike</h5>
                          <div class="d-flex">
                            <i class="fas fa-user-friends m-1 text-muted"></i>
                            <p>2 mutual friends: <span class="fw-bold">Jerry</span> and <span class="fw-bold">Phu</span></p>
                          </div>
                          <div class="d-flex">
                          <i class="fas fa-graduation-cap m-1 text-muted"></i>
                          <p>Studies at MIT</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  '
                                data-bs-html="true"
                        >
                            <div class="position-relative">
                                <img
                                        src="https://source.unsplash.com/random/4"
                                        alt="avatar"
                                        class="rounded-circle me-2"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                                <span
                                        class="
                        position-absolute
                        bottom-0
                        translate-middle
                        border border-light
                        rounded-circle
                        bg-success
                        p-1
                      "
                                        style="left: 75%"
                                >
                      <span class="visually-hidden"></span>
                    </span>
                            </div>
                            <p class="m-0">Mike</p>
                        </div>
                    </li>
                    <!-- friend 12 -->
                    <li
                            class="dropdown-item rounded my-2 px-0"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#singleChat2"
                    >
                        <!-- avatar -->
                        <div
                                class="d-flex align-items-center mx-2 chat-avatar"
                                data-bs-custom-class="chat-box"
                                data-bs-container="body"
                                data-bs-toggle="popover"
                                data-bs-placement="left"
                                data-bs-trigger="hover"
                                data-bs-content='
                          <div>
                            <div class="popover-body d-flex p-2">
                              <div>
                                <img src="https://source.unsplash.com/random/2" alt="avatar" class="pop-avatar"  />
                              </div>
                              <div >
                                <h5>Tuan</h5>
                                <div class="d-flex">
                                  <i class="fas fa-user-friends m-1 text-muted"></i>
                                  <p>2 mutual friends: <span class="fw-bold">Jerry</span> and <span class="fw-bold">Phu</span></p>
                                </div>
                                <div class="d-flex">
                                <i class="fas fa-graduation-cap m-1 text-muted"></i>
                                <p>Studies at MIT</p>
                                </div>
                              </div>
                            </div>
                          </div>
                        '
                                data-bs-html="true"
                        >
                            <div class="position-relative">
                                <img
                                        src="https://source.unsplash.com/random/2"
                                        alt="avatar"
                                        class="rounded-circle me-2"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                                <span
                                        class="
                        position-absolute
                        bottom-0
                        translate-middle
                        border border-light
                        rounded-circle
                        bg-success
                        p-1
                      "
                                        style="left: 75%"
                                >
                      <span class="visually-hidden"></span>
                    </span>
                            </div>
                            <p class="m-0">Tuan</p>
                        </div>
                    </li>
                    <!-- friend 13 -->
                    <li
                            class="dropdown-item rounded my-2 px-0"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#singleChat3"
                    >
                        <!-- avatar -->
                        <div
                                class="d-flex align-items-center mx-2 chat-avatar"
                                data-bs-custom-class="chat-box"
                                data-bs-container="body"
                                data-bs-toggle="popover"
                                data-bs-placement="left"
                                data-bs-trigger="hover"
                                data-bs-content='
                              <div>
                                <div class="popover-body d-flex p-2">
                                  <div>
                                    <img src="https://source.unsplash.com/random/3" alt="avatar" class="pop-avatar"  />
                                  </div>
                                  <div >
                                    <h5>Jerry</h5>
                                    <div class="d-flex">
                                      <i class="fas fa-user-friends m-1 text-muted"></i>
                                      <p>2 mutual friends: <span class="fw-bold">Jerry</span> and <span class="fw-bold">Phu</span></p>
                                    </div>
                                    <div class="d-flex">
                                    <i class="fas fa-graduation-cap m-1 text-muted"></i>
                                    <p>Studies at MIT</p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            '
                                data-bs-html="true"
                        >
                            <div class="position-relative">
                                <img
                                        src="https://source.unsplash.com/random/3"
                                        alt="avatar"
                                        class="rounded-circle me-2"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                                <span
                                        class="
                        position-absolute
                        bottom-0
                        translate-middle
                        border border-light
                        rounded-circle
                        bg-success
                        p-1
                      "
                                        style="left: 75%"
                                >
                      <span class="visually-hidden"></span>
                    </span>
                            </div>
                            <p class="m-0">Jerry</p>
                        </div>
                    </li>
                    <!-- friend 14 -->
                    <li
                            class="dropdown-item rounded my-2 px-0"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#singleChat4"
                    >
                        <!-- avatar -->
                        <div
                                class="d-flex align-items-center mx-2 chat-avatar"
                                data-bs-custom-class="chat-box"
                                data-bs-container="body"
                                data-bs-toggle="popover"
                                data-bs-placement="left"
                                data-bs-trigger="hover"
                                data-bs-content='
                          <div>
                            <div class="popover-body d-flex p-2">
                              <div>
                                <img src="https://source.unsplash.com/random/4" alt="avatar" class="pop-avatar"  />
                              </div>
                              <div >
                                <h5>Tony</h5>
                                <div class="d-flex">
                                  <i class="fas fa-user-friends m-1 text-muted"></i>
                                  <p>2 mutual friends: <span class="fw-bold">Jerry</span> and <span class="fw-bold">Phu</span></p>
                                </div>
                                <div class="d-flex">
                                <i class="fas fa-graduation-cap m-1 text-muted"></i>
                                <p>Studies at MIT</p>
                                </div>
                              </div>
                            </div>
                          </div>
                        '
                                data-bs-html="true"
                        >
                            <div class="position-relative">
                                <img
                                        src="https://source.unsplash.com/random/4"
                                        alt="avatar"
                                        class="rounded-circle me-2"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                                <span
                                        class="
                        position-absolute
                        bottom-0
                        translate-middle
                        border border-light
                        rounded-circle
                        bg-success
                        p-1
                      "
                                        style="left: 75%"
                                >
                      <span class="visually-hidden"></span>
                    </span>
                            </div>
                            <p class="m-0">Tony</p>
                        </div>
                    </li>
                    <!-- friend 15 -->
                    <li
                            class="dropdown-item rounded my-2 px-0"
                            type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#singleChat5"
                    >
                        <!-- avatar -->
                        <div
                                class="d-flex align-items-center mx-2 chat-avatar"
                                data-bs-custom-class="chat-box"
                                data-bs-container="body"
                                data-bs-toggle="popover"
                                data-bs-placement="left"
                                data-bs-trigger="hover"
                                data-bs-content='
                      <div>
                        <div class="popover-body d-flex p-2">
                          <div>
                            <img src="https://source.unsplash.com/random/5" alt="avatar" class="pop-avatar"  />
                          </div>
                          <div >
                            <h5>Phu</h5>
                            <div class="d-flex">
                              <i class="fas fa-user-friends m-1 text-muted"></i>
                              <p>2 mutual friends: <span class="fw-bold">Jerry</span> and <span class="fw-bold">Phu</span></p>
                            </div>
                            <div class="d-flex">
                            <i class="fas fa-graduation-cap m-1 text-muted"></i>
                            <p>Studies at MIT</p>
                            </div>
                          </div>
                        </div>
                      </div>
                    '
                                data-bs-html="true"
                        >
                            <div class="position-relative">
                                <img
                                        src="https://source.unsplash.com/random/5"
                                        alt="avatar"
                                        class="rounded-circle me-2"
                                        style="width: 38px; height: 38px; object-fit: cover"
                                />
                                <span
                                        class="
                        position-absolute
                        bottom-0
                        translate-middle
                        border border-light
                        rounded-circle
                        bg-success
                        p-1
                      "
                                        style="left: 75%"
                                >
                      <span class="visually-hidden"></span>
                    </span>
                            </div>
                            <p class="m-0">Phu</p>
                        </div>
                    </li>
                </div>
            </div>
        </div>
    </div>
</div>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"
></script>
<script src="./main.js"></script>
<script
        src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
        integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
        crossorigin="anonymous"
></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
        integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
        crossorigin="anonymous"
></script>
<script src="https://use.fontawesome.com/aed9ef824b.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>


    window.onload = () => {
        const valid = document.getElementsByClassName("userLiked");
        let thumb = document.getElementsByClassName("fa fa-thumbs-o-up");


        for (let i = 0; i < valid.length; i++) {

            if (valid[i].innerHTML === "true") {
                thumb[i].style.color = "#1977f2";
            }
        }
    }

    //edit post
    function edit(postId) {
        window.location.href = "edit.jsp?post=" + postId;

    }

    //comment on post
    function com(postId) {
        window.location.href = "comment.jsp?post=" + postId;
    }

    //like on post
    function like(postId, userId) {
        //fa fa-thumbs-o-up
        const URL = "LikeServlet";
        let like = document.getElementById(postId).style.color;


        if (like == "rgb(25, 119, 242)") {

            const valid = document.getElementsByClassName("thumb");
            document.getElementById(postId).style.color = "#000";

            for (let i = 0; i < valid.length; i++) {
                let newId = valid[i].innerHTML.split(" ")[0]; //the spliting later was not necessary

                if (newId == postId) {
                    let like = Number(document.getElementsByClassName("likes")[i].innerHTML);
                    like--;
                    document.getElementsByClassName("likes")[i].innerHTML = like + "";
                    console.log(document.getElementsByClassName("likes")[i]);

                    const data = {postId, userId, "action": 0}
                    ajaxCall(URL, data);
                }
            }
        } else {
            console.log("increment");

            const valid = document.getElementsByClassName("thumb");
            document.getElementById(postId).style.color = "#1977f2";

            for (let i = 0; i < valid.length; i++) {
                let newId = valid[i].innerHTML.split(" ")[0];

                if (newId == postId) {
                    let like = Number(document.getElementsByClassName("likes")[i].innerHTML);
                    like++;
                    document.getElementsByClassName("likes")[i].innerHTML = like + "";

                    const data = {
                        postId,
                        userId,
                        "action": 1
                    }
                    ajaxCall(URL, data);
                }
            }
        }
    }

    function ajaxCall(url, dataCall) {
        $.ajax({
            type: 'POST',
            url: url,
            data: dataCall,

            success: function (data) {

            },
            error: function () {
                alert('error liking');
            }
        });
    }

    // delete post
    function del(postId) {
        console.log("working");

        const delPost = confirm("Are you sure you want to delete post");

        if (delPost) {
            $.ajax({
                type: 'POST',
                url: 'DeleteServlet',
                data: {"postId": postId},

                success: function (data) {
                    console.log(data);
                    alert(data);
                    window.location.reload();
                },
                error: function () {
                    alert('error deleting post');
                }
            });
        }
    }

</script>
<%
    }
%>
</body>

</html>
