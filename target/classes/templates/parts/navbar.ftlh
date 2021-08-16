<#include "security.ftlh">
    <#import "login.ftlh" as l>



        <nav class="navbar navbar-expand-lg bg-dark navbar-dark p-3">

            <div class="container-fluid">
                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="white" class="bi bi-camera" viewBox="0 0 16 16">
                    <path d="M15 12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V6a1 1 0 0 1 1-1h1.172a3 3 0 0 0 2.12-.879l.83-.828A1 1 0 0 1 6.827 3h2.344a1 1 0 0 1 .707.293l.828.828A3 3 0 0 0 12.828 5H14a1 1 0 0 1 1 1v6zM2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2z"/>
                    <path d="M8 11a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5zm0 1a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7zM3 6.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
                </svg>

                <a class="navbar-brand" href="/main">Photogram</a><div class="vl mr-3"></div>


                <div>
                    <form class="d-flex g-3">
                        <input type="text" name="filter" class="form-control"
                               placeholder="Search by tag"/>
                        <button type="submit" class="btn btn-light ml-2">Search</button>
                    </form>
                </div>



                <div class="collapse navbar-collapse" >
                    <ul class="navbar-nav  me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" href="/main?filter=People">People</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/main?filter=Wallpapers">Wallpapers</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/main?filter=Future">Future</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/main?filter=Nature">Nature</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/main?filter=Cars">Cars</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/main?filter=Architecture">Architecture</a>
                        </li>

                        <#if isAdmin>
                            <li class="nav-item">
                                <a class="nav-link active" href="/user">User list</a>
                            </li>
                        </#if>
                    </ul>
                </div>


                <ul class="navbar-nav">
                    <a  href="/addPhoto" role="button">
                        Add Photo
                    </a>
                </ul>


                <#if user??>
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                ${name}
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                                <a class="dropdown-item" href="/likes">My Likes</a>
                                <a class="dropdown-item" href="/user-messages/${currentUserId}?">My Posts</a>
                                <a class="dropdown-item" href="/user/profile?">My Profile</a>
                                <form action="/logout" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                    <button class="btn btn-primary mt-2 ml-3" type="submit"><#if user??>Sign out<#else>Login</#if></button>
                                </form>
                            </ul>
                        </li>
                    </ul>
                    <#else><a><@l.logout /></a>
                </#if>
            </div>
        </nav>


