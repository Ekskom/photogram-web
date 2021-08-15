<#import "parts/common.ftlh" as c>

<@c.page>
List of users

<table>
    <thead>
    <tr>
        <h3>Name</h3>
        <h3>Role</h3>
        <th></th>
    </tr>
    </thead>
    <tbody>
<#list users as user>
    <tr>

        <h3>${user.username}</h3>
        <h3><#list user.roles as role>${role}<#sep>, </#list></h3>
        <h3><a href="/user/${user.id?c}">edit</a></h3>
    </tr>

</#list>
    </tbody>
</table>
</@c.page>