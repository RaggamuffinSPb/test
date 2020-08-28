<#import "parts/common.ftlh" as c>


<@c.page>
<div class="form-row">
    <div class="col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Поиск по тэгу">
            <button type="submit" class="btn btn-primary ml-2">Найти</button>
        </form>
    </div>
</div>

<a class="btn btn-primary mt-3 mb-1" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Запостить
</a>
<div class="collapse" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" name="text" class="form-control" placeholder="Введите текст сообщения"/>
            </div>
            <div class="form-group">
                <input type="text" name="tag" class="form-control" placeholder="Тэг"/>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile" placeholder="Выберите файл">
                    <label class="custom-file-label" for="customFile"></label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="form-group">
                <button type="submit" class="btn btn-primary ml-2">Добавить</button>
            </div>
        </form>
    </div>

</div>
<div class="card-columns">
    <#list messages as message>
    <div class="card my-3">
        <div>
            <#if message.filename??>
                <img class="card-img-top" src="/img/${message.filename}">
            </#if>
        </div>
        <div class="m-2">
            <span>${message.text}</span>
            <i>${message.tag}</i>
        </div>
        <div class="card-footer text-muted">${message.authorName}</div>

    </div>
    <#else>
<i>No messages</i>
    </#list>
</div>
</@c.page>