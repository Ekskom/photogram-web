
    <div class="form-group mt-3">
        <form enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control ${(tagError??)?string('is-invalid', '')}"
                       value="<#if message??>${message.tag}</#if>" name="tag" placeholder="Тэг" >
                <#if tagError??>
                    <div class="invalid-feedback">
                        ${tagError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <div class="custom-file ${(fileError??)?string('is-invalid', '')}">
                    <input type="file" name="file" id="customFile" value="<#if message??>${message.tag}</#if>" />
                    <#if fileError??>
                    <div class="invalid-feedback">
                        ${fileError}
                    </div>
                    </#if>
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
            <div class="form-group">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <input type="hidden" name="id" value="<#if message??>${message.id!}<#else></#if>" />
                <button type="submit" class="btn btn-primary">Save message</button>
            </div>
        </form>
    </div>
