<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지2</title>
<style type="text/css">
html {
  height: 100%;
}
body {
  margin:0;
  padding:0;
  font-family: sans-serif;
  background: rgb(30,30,30);
}
header{ position:fixed; height: 60px; width:100%; background: rgb(30,30,30);}

.login-box {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 400px;
  padding: 40px;
  transform: translate(-50%, -50%);
  background: rgba(0,0,0);
  box-sizing: border-box;
  box-shadow: 0 15px 25px rgba(0,0,0,.6);
  border-radius: 10px;
}

.login-box h2 {
  margin: 0 0 30px;
  padding: 0;
  color: #fff;
  text-align: center;
}

.login-box .user-box {
  position: relative;
}

.login-box .user-box input {
  width: 100%;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  margin-bottom: 30px;
  border: none;
  border-bottom: 1px solid #fff;
  outline: none;
  background: transparent;
}
.login-box .user-box label {
  position: absolute;
  top:0;
  left: 0;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  pointer-events: none;
  transition: .5s;
}

.login-box .user-box input:focus ~ label,
.login-box .user-box input:valid ~ label {
  top: -20px;
  left: 0;
  color: #03e9f4;
  font-size: 12px;
}

.login-box form a {
  position: relative;
  display: inline-block;
  padding: 10px 20px;
  color: #03e9f4;
  font-size: 16px;
  text-decoration: none;
  text-transform: uppercase;
  overflow: hidden;
  transition: .5s;
  margin-top: 40px;
  letter-spacing: 4px
}

.login-box a:hover {
  background: #03e9f4;
  color: #fff;
  border-radius: 5px;
  box-shadow: 0 0 5px #03e9f4,
              0 0 25px #03e9f4,
              0 0 50px #03e9f4,
              0 0 100px #03e9f4;
}

.login-box a span {
  position: absolute;
  display: block;
}

.login-box a span:nth-child(1) {
  top: 0;
  left: -100%;
  width: 100%;
  height: 2px;
  background: linear-gradient(90deg, transparent, #03e9f4);
  animation: btn-anim1 1s linear infinite;
}

@keyframes btn-anim1 {
  0% {
    left: -100%;
  }
  50%,100% {
    left: 100%;
  }
}

.login-box a span:nth-child(2) {
  top: -100%;
  right: 0;
  width: 2px;
  height: 100%;
  background: linear-gradient(180deg, transparent, #03e9f4);
  animation: btn-anim2 1s linear infinite;
  animation-delay: .25s
}

@keyframes btn-anim2 {
  0% {
    top: -100%;
  }
  50%,100% {
    top: 100%;
  }
}

.login-box a span:nth-child(3) {
  bottom: 0;
  right: -100%;
  width: 100%;
  height: 2px;
  background: linear-gradient(270deg, transparent, #03e9f4);
  animation: btn-anim3 1s linear infinite;
  animation-delay: .5s
}

@keyframes btn-anim3 {
  0% {
    right: -100%;
  }
  50%,100% {
    right: 100%;
  }
}

.login-box a span:nth-child(4) {
  bottom: -100%;
  left: 0;
  width: 2px;
  height: 100%;
  background: linear-gradient(360deg, transparent, #03e9f4);
  animation: btn-anim4 1s linear infinite;
  animation-delay: .75s
}

@keyframes btn-anim4 {
  0% {
    bottom: -100%;
  }
  50%,100% {
    bottom: 100%;
  }
}
</style>
<script>
  function check_pw() { 
     if(document.getElementById('pw').value !='' && document.getElementById('pw2').value!=''){
          if(document.getElementById('pw').value==document.getElementById('pw2').value){
              document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
              document.getElementById('check').style.color='blue';
          }
          else{
              document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
              document.getElementById('check').style.color='red';
              
          }
     }
}
  function addID() {
		Idcheck.submit();
	}
  function idset(){
  var id = document.getElementById("ID");
  var kh_id = document.getElementById("KH_ID");
	id.value = kh_id.value;
	}
</script>
</head>

<body>
<header>
<jsp:include page="../include/menubar.jsp"></jsp:include>
</header>

	<div class="bnr">
		<img alt="bnr" src="./images/mainpage.PNG" style="width: 100%; height: 750px;">

	</div>
	<div class="login-box">
  <h2>Join</h2>
  <form name="joinForm" action="./MemberJoinAction.me" method="post" >
    <div class="user-box">
    <p>
      <input type="text" name="KH_ID"  id="KH_ID" required="">
      <label>ID</label>
    </p>
    </div>
      <input type="button" onclick="javascript:idset(); addID();" value="중복 확인">
    <div class="user-box">
      <p>
        <input type="password" name="KH_PW"  id="pw" onchange="check_pw()" required="">
        <label>Password :</label>
      </p>
     </div>
     <div class="user-box">
	  <p>
	    <input type="password" name="KH_PW_re"  id="pw2" onchange="check_pw()" required="">
        <label>Password check :</label>
        <font id="check" size="2"></font>
      </p>
    </div>
    <div class="user-box">
      <input type="text" name="KH_NAME" required="">
      <label>Name</label>
    </div>
    <div class="user-box">
      <input type="text" name="KH_TEL" required="">
      <label>Tel</label>
    </div>        
    <a href="javascript:joinForm.submit()">
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      Sign up
    </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="javascript:joinForm.reset()">
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      Reset
    </a>    
  </form>
</div>
<form name="Idcheck" action="./MemberIdCheckAction.me" method="post">
			<input type="hidden" name="kh_id" id="ID">
</form>
</body>
<script src="member.js"></script>
</html>