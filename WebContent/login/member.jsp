<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="main2.css">



<style>
#third {
	width:2000px;
	height:700px;
	margin:auto; 
}
</style>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
  function check()
  {
     var member=document.pkc;
     if(member.userid.value == "")
        {
           alert("아이디를 입력하세요.")
           member.userid.focus();
             return false;
        }
     else if(member.userid.value.length < 4)
      {
         alert("아이디는 4자 이상 적으세요");
         return false;
      }
     else if(member.pwd.value.length < 4)
      {
         alert("비밀번호는 4자 이상 적으세요");
         return false;
      }
     else if(member.pwd.value != member.pwd2.value)
        {
           alert("비밀번호가 다릅니다.")
           member.pwd.value="";
           member.pwd2.value="";
           return false;
        }
     else
        return true; 
             
  }
  function userid_check()
  {
     var member=document.pkc;
     var chk=new XMLHttpRequest();
     var url="userid_check.jsp?userid="+member.userid.value;
     
     chk.open("get", url);
     chk.send();
     
     chk.onreadystatechange=function()
     {
        if(chk.readyState == 4)
           {
              if(chk.responseText.trim() == "1")
               {
                  alert("사용 중인 아이디입니다.");
                  member.userid.value="";
               }
               else
               {
                  alert("사용 가능한 아이디입니다.");
               }
           }
     }
  }
</script>


<c:import url="../top2.jsp"/>
	<div id="third"> <!-- 문서내용// 항상 top에 오는 부분 -->
	
	
</head>
<body>
  <form name="pkc" method="post" action="member_ok.jsp" onsubmit="return check()">
    

    <p align="center"> <img src="../bluebg.png" width="2000" height="35"> <p>
   
    <table width="600" align="center" class="member_form">
			<caption style="padding-bottom:30px"> 회원가입 </caption> 

      <tr>
        <td> 아이디 </td>
        <td> <input type="text" class="text_form" name="userid" placeholder="4자 이상" autocomplete="off">
            <input type="button" onclick="userid_check()" value="중복확인"> </td>
      </tr>
      <tr>
        <td> 비밀번호 </td>
        <td> <input type="password"  class="text_form" name="pwd" placeholder="4자 이상" autocomplete="off"> </td>
      </tr>
      <tr>
        <td> 비밀번호 확인 </td>
        <td> <input type="password" class="text_form" name="pwd2" autocomplete="off"> </td>
      </tr>
      <tr>
        <td> 이메일 </td>
        <td> <input type="text" class="text_form"  name="email" autocomplete="off"> </td>
      </tr>
      <tr>
        <td> 카카오톡 ID </td>
        <td> <input type="text"  class="text_form" name="kakao" autocomplete="off"> </td>
      </tr>
      <tr>
        <td> 전화번호 </td>
        <td> <input type="text"  class="text_form" name="phone" autocomplete="off"> </td>
      </tr>
      <tr>
        <td> 생년월일 </td>
        <td> <input type="text" class="text_form" name="birth" placeholder="8자리 입력 ex)20210422" autocomplete="off"> </td>
      </tr>
      <tr>
        <td> 성별 </td>
        <td>
          <input type="radio" name="gender" value="1">남자
          <input type="radio" name="gender" value="2">여자
        </td>
      </tr>
      <tr align="center">
        <td colspan="2"> <input type="submit" class="submit_form" value="회원가입"> </td>
      </tr>
    </table>
  </form>
</body>


</html>

</div>
<c:import url="../bottom.jsp"/>
