<nav class="navigation-bar dark">
    <div class="navigation-bar-content">
        <a href="/" class="element"><span class="icon-grid-view"></span> VIEW TOUCH <sup>1.0</sup></a>
        <span class="element-divider"></span>
        <a class="pull-menu" href="#"></a>
        <ul class="element-menu">
            <li>
                <a class="dropdown-toggle" href="#">Questions</a>
                <ul class="dropdown-menu dark" data-role="dropdown" style="display: none;">
                    <li><a href="/question/create">Create</a></li>
                    <!-- <li>
                        <a href="#" class="dropdown-toggle">General CSS</a>
                        <ul class="dropdown-menu dark" data-role="dropdown">
                            <li><a href="global.html">Global styles</a></li>
                            <li><a href="grid.html">Grid system</a></li>
                            <div class="divider"></div>
                            <li><a href="typography.html">Typography</a></li>
                            <li><a href="tables.html">Tables</a></li>
                            <li><a href="forms.html">Forms</a></li>
                            <li><a href="buttons.html">Buttons</a></li>
                            <li><a href="images.html">Images</a></li>
                        </ul>
                    </li> -->
                    <li class="divider"></li>
                    <li><a href="/question/list">List</a></li>
                    <!-- <li><a href="responsive.html">Responsive</a></li>
                    <li class="disabled"><a href="layouts.html">Layouts and templates</a></li>
                    <li class="divider"></li>
                    <li><a href="icons.html">Icons</a></li> -->
                </ul>
            </li>
            <li>
                <a class="dropdown-toggle" href="#">Tests</a>
                <ul class="dropdown-menu dark" data-role="dropdown" style="display: none;">
                    <li><a href="/test/create">Create</a></li>
                    <li class="divider"></li>
                    <li><a href="/test/list">List</a></li>
                    <!-- <li class="disabled"><a href="http://blog.metroui.net">Blog</a></li>
                    <li class="disabled"><a href="http://forum.metroui.net">Community Forum</a></li>
                    <li class="divider"></li>
                    <li><a href="https://github.com/olton/Metro-UI-CSS">Github</a></li>
                    <li class="divider"></li>
                    <li><a href="https://github.com/olton/Metro-UI-CSS/blob/master/LICENSE">License</a></li> -->
                </ul>
            </li>
        </ul>
        <div class="no-tablet-portrait">
            <span class="element-divider"></span>
            <!-- <a class="element brand" href="#"><span class="icon-spin"></span></a>-->
            {%if _ques_show%}
            <a class="element brand" href="/question/edit/{{question.id}}"><span class="icon-code" title="Update this question"></span></a>
            {%endif%} 
            <span class="element-divider"></span>
            <div class="element input-element">
                <form action="/question/search" autocomplete="off" disableautocomplete>
                    <div class="input-control text">
                        <input type="text" name="key" placeholder="Search..." value="">
                        <button class="btn-search"></button>
                    </div>
                </form>
            </div>
            <div class="element place-right">
                <a class="dropdown-toggle" href="#">
                    <span class="icon-cog"></span>
                </a>
                <ul class="dropdown-menu place-right" data-role="dropdown">
                    <li><a href="#">Settings</a></li>
                    <li><a href="#">Hello</a></li>
                    <li><a href="#">About</a></li>
                </ul>
            </div>
            <span class="element-divider place-right"></span>
            <button class="element image-button image-left place-right">
            {{username}}
            </button>
        </div>
    </div>
</nav>