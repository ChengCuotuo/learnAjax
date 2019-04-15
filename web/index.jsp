<%--
  Created by IntelliJ IDEA.
  User: lei02
  Date: 2019/4/15
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <!--
    1.导入 jQuery 库
    2.获取 name = "userName" 的节点：userName
    3.为 userName 添加 change 相应函数
    3.1获取 userName 的 value 属性值，去除前后空格并且不为空，准备发送 Ajax 请求
    3.2 发送 Ajax 请求检验 userName 是否可用
    3.3 在服务端直接返回一个 html 片段
    3.4 在客户端浏览器把其直接添加到 #message 的html 中

    获取服务器的绝对路径：${pageContext.request.contextPath}
  -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/script/jquery-1.10.1.js"></script>
  <script type="text/javascript">
    $(function(){
      $(":input[name='userName']").change(function(){
        var val = $(this).val();
        val = $.trim(val);
        if (val != "") {
          var url = "${pageContext.request.contextPath}/valiateUserName";
          //alert(url);  //valiateUserName 也就是 web.xml 需要配置响应的就是 valiateUserName
          var args = {"userName" : val, "time" : new Date()};
          //通过远程的 http post 请求载入信息
          //jQuery.post(url, [data], [callback], [type]):XMLHttpRequest
          // callback 是发送成功时的回调函数
          // type 的类型有 xml, html, script, json, text
          $.post(url, args, function (data) {
            $("#message").html(data)
          })
        }
      })
    })
  </script>
  <body>
    <form action="" method="post">
      userName：<input type="text" name="userName"/>
      <br />
      <div id="message"></div>
      <br />
      <input type="submit" value="Submit"/>
    </form>
  </body>
</html>
