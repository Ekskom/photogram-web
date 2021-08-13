<#import "parts/common.ftlh" as c>

<@c.page>


    <h3>${userChannel.username} ${type}</h3>

    <div class="container">
        <div class="list-group list-group-numbered">
        <#list users as user>
            <li class="list-group-item">
                <a href="/user-messages/${user.id}">${user.getUsername()}</a>
            </li>
        </#list>
        </div>
        </div>
    </ul>
</@c.page>