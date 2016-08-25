# ll-php-support package

公司的项目很古老，使用的是CI 2.0 的改版，
造成没法使用大神们做的插件，只能DIY一个了。

此插件是拷贝 atom-autocomplete-php 修改的

1、把隐式的成员属性当作类名，用以解决类似 
    $this->load->model('xxx_model');
    $this->xxx_model->xxx 的自动补全
2、autoload 多暴漏了当前脚本的路径，之前只有atom打开的项目路径
3、鼠标定位对 tab=4个空格的兼容



@TODO 
goto和annotation没做，我得滚去敲代码了


暂时就这么多

![A screenshot of your package](https://f.cloud.github.com/assets/69169/2290250/c35d867a-a017-11e3-86be-cd7c5bf3ff9b.gif)
