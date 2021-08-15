<#import "parts/common.ftlh" as c>



<@c.page>


    <i class="far fa-user"></i>
    <h6 class="mt-5"> ${userChannel.username}</h6>
    <div class="container">
        <div class="row">
            <div class="col">
                <#if !isCurrentUser>
                    <#if isSubscriber>
                        <a class="btn btn-info" href="/user/subscribe/${userChannel.id}">Unsubscribe</a>
                        <#else>
                            <a class="btn btn-info" href="/user/subscribe/${userChannel.id}">Subscribe</a>
                    </#if>
                </#if>

                    <a class="btn btn-dark mr-2" href="/user/subscriptions/${userChannel.id}/list">Subscriptions: ${subscriptionsCount}</a>


                    <a class="btn btn-dark mr-2" href="/user/subscribers/${userChannel.id}/list">Subscribers: ${subscribersCount}</a>


                    <a class="btn btn-dark"  href="#">Publications: ${messagesSize}</a>


            </div>
        </div>

    </div>



<#if isCurrentUser && message??>
    <#include "parts/messageEdit.ftlh" />
</#if>


    <#include "parts/messageList.ftlh" />

</@c.page>

