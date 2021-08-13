<#macro login path isRegisterForm>
    <div class="wrapper">
        <div class="form">
            <div class="title">Login to Spring</div>
            <form action="${path}" method="post">
                <script src="https://www.google.com/recaptcha/api.js" async defer></script>


                <div class="input_wrap">
                    <label for="input_text">Username</label>
                    <div class="input_field">
                        <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                               class="form-control ${(usernameError??)?string('is-invalid', '')}"
                               id="input_text" required>
                        <#if usernameError??>
                            <div class="invalid-feedback">
                                ${usernameError}
                            </div>
                        </#if>
                    </div>
                </div>

                <div class="input_wrap">
                    <label for="input_password">Password</label>
                    <div class="input_field">
                        <input type="password" name="password"
                               class="form-control ${(passwordError??)?string('is-invalid', '')}"
                               id="input_password">
                        <#if passwordError??>
                            <div class="invalid-feedback">
                                ${passwordError}
                            </div>
                        </#if>
                    </div>
                </div>


                <#if isRegisterForm>
                    <div class="input_wrap">
                        <label for="input_password2">Retype Password</label>
                        <div class="input_field">
                            <input type="password" name="password2"
                                   class="form-control ${(passwordError??)?string('is-invalid', '')}"
                                   id="input_password2">
                            <#if password2Error??>
                                <div class="invalid-feedback">
                                    ${password2Error}
                                </div>
                            </#if>
                        </div>
                    </div>

                    <div class="input_wrap">
                        <label for="input_email">Email</label>
                        <div class="input_field">
                            <input type="email" name="email"
                                   class="form-control ${(emailError??)?string('Email is-invalid', '')}"
                                   id="input_email">
                            <#if emailError??>
                                <div class="invalid-feedback">
                                    ${emailError}
                                </div>
                            </#if>
                        </div>
                    </div>

                    <div class="input_wrap">
                        <div class="input_field">
                        <div class="g-recaptcha" data-sitekey="6LeBLtUbAAAAAP8xaZbk0iH74kQd-59tgoUo5oKc"></div>
                        <#if captchaError??>
                            <div class="alert alert-danger" role="alert">
                                ${captchaError}
                            </div>
                        </#if>
                        </div>
                    </div>
                </#if>

                <input type="hidden" name="_csrf" value="${_csrf.token}" />



                    <div class="input_wrap">
                        <button  type="submit" class="btn btn-primary w-100" ><#if isRegisterForm>Create<#else>Sign In</#if></button>
                    </div>
                <#if !isRegisterForm> <a href="/registration">Create new user</a></#if>
            </form>
        </div>
    </div>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-info ml-4" type="submit"><#if user??>Sign out<#else>Login</#if></button>
    </form>

</#macro>