<#import "parts/common.ftlh" as c>


    <@c.page>


    <div class="wrapper">
        <div class="form">
            <div class="title">Last step</div>
            <form method="post" enctype="multipart/form-data">
                <div class="input_wrap">
                        <input class="form-control ${(tagError??)?string('is-invalid', '')}" name="tag" list="datalistOptions" id="exampleDataList" placeholder="Type to search...">
                        <datalist id="datalistOptions">
                        <option name="tag" value="People">
                        <option name="tag" value="Wallpapers">
                        <option name="tag" value="Future">
                        <option name="tag" value="Architecture">
                        <option name="tag" value="Other">
                    </select>
                    <#if tagError??>
                        <div class="invalid-feedback">
                            ${tagError}
                        </div>
                    </#if>
                </div>

                <div class="example-2">
                    <div class="form-group">
                        <input type="file" name="file" id="file" class="input-file ${(fileError??)?string('is-invalid', '')}" >
                        <label for="file" class="btn btn-tertiary js-labelFile" >
                            <i class="icon fa fa-check"></i>
                            <span class="js-fileName">Select photo</span>
                        </label>
                        <#if fileError??>
                            <div class="invalid-feedback">
                                ${fileError}
                            </div>
                        </#if>
                    </div>
                </div>

                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <input type="hidden" name="id" value="<#if message??>${message.id!}<#else>-1</#if>" />
                <div class="form-group">
                    <button type="submit" class="btn btn-primary w-100">Save message</button>
                </div>
            </form>
        </div>
    </div>


</@c.page>