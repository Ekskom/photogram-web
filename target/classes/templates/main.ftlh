<#import "parts/common.ftlh" as c>

    <#if filter == "">
    <div class="card bg-dark text-white">
        <img src="https://images.unsplash.com/photo-1553232668-a27bf13f85fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1889&q=80"
             width="100%"
             height="600"
             alt="..."
        >
        <div class="card-img-overlay">
            <div class="container">
                <h2>Photogram</h2>
                <h5>The internet’s source of freely-usable images.<br/>Powered by creators everywhere.</h5>
                <div>
                    <form class="d_input">
                        <input type="text" name="filter" class="form-control"
                               placeholder="Search by tag"/>
                        <button type="submit" class="btn btn-light ml-2">Search</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </#if>



    <@c.page>




    <#if filter == "People">
        <h1>PEOPLE</h1>
        <h3>Real people, captured. Photography has the power to
            reflect the world around us, give<br/> voice to individuals
            and groups within our communities — and most importantly —
            tell their story.
        </h3>

    </#if>


    <#if filter == "Future">
        <h1>FUTURE</h1>
        <h3>Hypothetical part of the timeline, many events that have not yet happened, but can happen.
        </h3>

    </#if>


    <#if filter == "Wallpapers">
        <h1>WALLPAPERS</h1>
        <h3>From epic drone shots to inspiring moments <br/>in nature, find free
            HD wallpapers worthy of your mobile and desktop screens.
        </h3>

    </#if>


    <#if filter == "Architecture">
        <h1>ARCHITECTURE</h1>
        <h3>Explore exteriors from around the world — from brutalist buildings<br/> to minimalist
            structures that will give you a new appreciation for the art of architecture.
        </h3>

    </#if>


    <#include "parts/messageList.ftlh" />


</@c.page>


