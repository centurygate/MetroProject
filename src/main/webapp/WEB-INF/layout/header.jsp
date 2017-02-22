<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>

        <a class="navbar-brand" href="#"><span>XKEN</span>SYSTEM</a>

        <ul class="user-menu">
            <li class="dropdown pull-right">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg>
                    <sec:authentication property="principal.username"/>
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu" role="menu">
                    <li>
                        <a href="#"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg>简介</a>
                    </li>
                    <li>
                        <a href="#"><svg class="glyph stroked gear"><use xlink:href="#stroked-gear"></use></svg>设置</a>
                    </li>
                    <li>
                        <a href="logout"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg>退出</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div><!-- /.container-fluid -->