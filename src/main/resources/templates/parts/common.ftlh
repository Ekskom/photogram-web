<#macro page>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>SpringProg</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->

        <script src="https://cdnjs.cloudflare.com/ajax/libs/turbolinks/5.2.0/turbolinks.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">



        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script src="https://kit.fontawesome.com/23bb3b7ea4.js" crossorigin="anonymous"></script>


        <style>

            .btn-light{
                background-color: inherit;
                color: white;
            }



            .vl {
                border-left: 1px solid white;
                height: 40px;
            }

            i{
                font-size: 25px;
                color: lightgray;
            }
            i:hover{
                color: lightyellow;
                transition: .5s;
            }

            h1 {
                margin-top: 7rem;
                margin-left: 6.8rem;
                font-family: 'Comfortaa', sans-serif; /* Гарнитура текста */
                font-size: 300%; /* Размер шрифта в процентах */
                color: white;
            }

            h2 {
                text-align: left;

            }
            h5{
                text-align: left;

                color: white;
            }

            h3{
                margin-left: 6.8rem;
                font-family: 'Comfortaa', sans-serif; /* Гарнитура текста */
                font-size: 150%; /* Размер шрифта в процентах */
                color: white;
            }


            h4{
                font-size: 400%;
                text-align: center;
                color: white;
            }
            h6{
                font-size: 400%;
                text-align: center;
                color: white;
                margin-left: 20px;

            }

            .fa-user{
                margin-top: 30px;
                font-size: 400%;
                margin-left: 48.5%;

            }
            .list-group-item {

                width: 100px;
            }


            a{
                font-family: 'Comfortaa', sans-serif;
                color: grey;

            }

            a:hover{

                color: antiquewhite;
                transition: .5s;
            }

            a:-webkit-any-link{
                text-decoration: none;

            }








            .row {
                display: -ms-flexbox;

                -ms-flex-wrap: wrap;
                flex-wrap: wrap;
                margin-right: -15px;
                margin-left: -15px;
            }

            p {
                color: white;
                margin-left: 6.7rem;
                font-family: Georgia, 'Times New Roman', Times, serif;
                font-size: 14pt; /* Размер шрифта в пунктах */
            }
            .container {
                display: inline;
                width: 95%;
                padding-left: 16%;
                text-align: center;
            }




            * {
                margin: 0;
                font-family: "Artifakt Element",sans-serif;
                box-sizing: border-box;
            }
            .post-wrap {
                max-width: 1120px;
                margin: 0 auto;
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
            }
            .post-item {
                padding: 10px;
            }
            .post-item-wrap {
                position: relative;
            }
            .post-item img {
                display: block;
                width: 100%;
            }
            .post-item:hover .post-info-top {

                opacity: 1;
            }
            .post-item:hover .post-info-bot {
                opacity: 1;
            }
            .post-link {
                text-decoration: none;
            }
            .post-info-top {
                background: linear-gradient(to top, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, .5) 100%);
                color: white;
                opacity: 0;
                position: absolute;
                top: 0;
                width: 100%;
                transition: .5s;
            }
            .post-info-bot {
                background: linear-gradient(to bottom, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, .5) 100%);
                color: white;
                opacity: 0;
                position: absolute;
                bottom: 0;
                width: 100%;
                transition: .5s linear;
            }


            .top-right{
                position: absolute;
                top: 8px;
                right: 16px;
            }

            .bot-right{
                position: absolute;
                top: 8px;
                right: 16px;
            }


            .post-meta {

                font-weight: 500;
                font-size: 17px;
                padding: 40px 20px;
                margin-bottom: 15px;
                position: relative;
                display: inline-flex;
                align-items: center;
            }
            .post-date:after {
                font-size: 14px;
            }
            .post-title {
                padding: 0 15px;
                font-weight: 600;
                margin-bottom: 15px;
            }
            @media (min-width: 768px) {
                .post-item {
                    flex-basis: 50%;
                    flex-shrink: 0;
                }
            }
            @media (min-width: 960px) {
                .post-item {
                    flex-basis: 33.333333333%;
                }
            }

            .dropdown-menu[data-bs-popper] {
                top: 100%;
                left: -54px;
                margin-top: -0.875rem;
            }


            .container {
                width: 110%;
                padding-right: 112px;
                padding-left: 111px;
                margin-right: auto;
                margin-left: auto;
            }

            body {
                margin-top: 70px;
                background-color: #333;
            }
            .bg-dark {
                background-color: #1d1d1d!important;
            }
            .dropdown-menu {
                position: absolute;
                top: 100%;
                left: 0;
                z-index: 1000;
                display: none;
                float: left;
                min-width: 10rem;
                padding: 0.5rem 10px;
                margin: .125rem 0 0;
                font-size: 1rem;
                color: #212529;
                text-align: left;
                list-style: none;
                background-color: #454545;
                background-clip: padding-box;
                border: 22px solid rgba(0,0,0,-0.85);
                border-radius: 2.25rem;
            }
            .card-columns{
                margin-right: 100px;
                margin-left: 100px;
            }

            /*<!-- Form l -->*/

            .wrapper{
                min-height: 70vh;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .form{
                width: 425px;
                height: auto;
                background: #fff;
                padding: 35px 50px;
                border-radius: 2px;
            }
            .form .title{
                text-align: center;
                margin-bottom: 20px;
                font-weight: 700;
                font-size: 24px;
            }
            .form .input_wrap{
                margin-bottom: 20px;
                width: 325px;
                position: relative;
            }
            .form .input_wrap .input_field{
                position: relative;
            }
            .btn-primary {
                width: 75%;
                color: #fff;
                background-color: #17a2b8;

            }

            [class^="bi-"]::before, [class*=" bi-"]::before {
                display: inline-block;
                font-family: bootstrap-icons !important;
                font-style: normal;
                font-weight: normal !important;
                font-variant: normal;
                text-transform: none;
                line-height: 0;
                vertical-align: 0.3em;
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;
            }

            .d_input{
                display: inline-flex!important;
                margin-right: 84%;
            }

            .navbar{
                top: 0;
                position: fixed;
                width: 100%;
                z-index:1000;
                border: 1px solid #000;
            }

            /*Photo page*/

            .example-2 .btn-tertiary{color:#555;padding:0;line-height:40px;width:325px;margin:auto;display:block;border:2px solid #555}
            .example-2 .btn-tertiary:hover,.example-2 .btn-tertiary:focus{color:#888;border-color:#888}
            .example-2 .input-file{width:.1px;height:.1px;opacity:0;overflow:hidden;position:absolute;z-index:-1}
            .example-2 .input-file + .js-labelFile{overflow:hidden;text-overflow:ellipsis;white-space:nowrap;padding:0 10px;cursor:pointer}
            .example-2 .input-file + .js-labelFile .icon:before{content:"\f093"}
            .example-2 .input-file + .js-labelFile.has-file .icon:before{content:"\f00c";color:#5AAC7B}

            .alert {
                position: absolute;
                padding: .75rem 1.25rem;
                margin-bottom: 1rem;
                border: 1px solid transparent;
                border-radius: .25rem;
            }




        </style>
    </head>
    <body>
    <#include "navbar.ftlh">
        <div class="container-fluid mt-5">
            <#nested>
        </div>
        <!-- Optional JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

    </body>
    </html>
</#macro>