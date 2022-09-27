<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/room_style.css">
<style type="text/css">



img {
   padding-top :100px;
   width: 100px;
   height: 180px;
   
}

</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

</head>
<body>
<!-- <div class="container">
   <div class="row row1">
      <div class="mypage">
         <img src="../img/user-info-icon.png">
         <h1>회원님의 소중한 개인정보를 위해<hr>비밀번호를 확인 해 주세요!</h1>
         <ul>
            <li>
               <input type=password ref=pwd size=15 class="pww" placeholder="비밀번호를 입력하세요" v-model="pwd">
            </li>
         </ul>
         <ul>
            <li class="pwwco">
               <button><a>비밀번호 확인</a></button>
            </li>
            <li class="mypagecs">
               <p>* 비밀번호를 분실하셨나요? </p><button class="mycs"><a>비밀번호 찾기</a></button>
            </li>
         </ul>
         </div>
   </div>
</div> -->
 <div class="container">
    <div class="row row1">
      <table class="table">
        <tr>
           <td class="text-center">
               <img src="../img/user-info-icon.png">
               <br>
               <h3>회원님의 소중한 개인정보를 위해 <br> 비밀번호를 확인 해 주세요!</h3>
           </td>
        </tr>
        <tr>
         <td class="text-center">
           <input type=password ref=pwd style="width:230px; height:50px" class="input-sm" v-model="pwd" placeholder="비밀번호를 입력하세요">
         </td>
        </tr>
        <tr>
          <td class="text-center">
            <input type=button value="확인" class="btn btn-sm btn-warning" v-on:click="ok()">
            <input type=button value="취소" class="btn btn-sm btn-info"
              onclick="javascript:history.back()"
            >
          </td>
        </tr>
      </table>
    </div>
  </div> 
  <script>
    new Vue({
       el:'.container',
       data:{
          pwd:''
       },
       methods:{
          ok:function(){
             if(this.pwd==="")
             {
                this.$refs.pwd.focus();//$('#id명').focus()
                return;
             }
             
             // 비밀번호 입력
             let _this=this;
             //axios.post() axios.get()
             axios.get('http://localhost:8080/web/member/join_before_ok.do',{
                params:{
                   pwd:this.pwd
                }
             }).then(function(result){
                let res=result.data;
                if(res==='yes')
                {
                   location.href="../member/join_update.do";
                }
                else
                {
                   alert("비밀번호가 틀립니다");
                   _this.pwd="";
                   _this.$refs.pwd.focus();
                }
             })
          }
       }
    })
  </script>
</body>
</html>