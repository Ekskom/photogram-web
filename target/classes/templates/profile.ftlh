<#import "parts/common.ftlh" as c>
    <@c.page>

    <div class="wrapper">
        <form method="post">
        <div class="form">
            <div class="title"> <svg xmlns="http://www.w3.org/2000/svg" width="66" height="66" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
            </svg></div>
            <div class="title">${username}</div>
            ${message?ifExists}
                <div class="input_wrap">
                    <label for="input_text">Enter new password</label>
                    <div class="input_field">
                            <input type="password" name="password"
                                   class="form-control"
                                   placeholder="Password" id="input_text"/>
                    </div>
                </div>
                <div class="input_wrap">
                    <label for="input_password">Enter new email</label>
                    <div class="input_field">
                        <input id="input_password" type="email" name="email" class="form-control" value="${email!''}" />
                    </div>
                </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button type="submit" class="btn btn-primary w-100">Save</button>
        </div>
        </form>
    </div>







</@c.page>