<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Untree.co">
  <link rel="shortcut icon" href="favicon.png">

  <meta name="description" content="" />
  <meta name="keywords" content="bootstrap, bootstrap4" />

		<!-- Bootstrap CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
		<link href="css/tiny-slider.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<title>Furni Free Bootstrap 5 Template for Furniture and Interior Design Websites by Untree.co </title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  
  <script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
  $(function(){
      $('#okid').hide();
       //$( "#dialog" ).dialog();
       $('#idcheck').click(function(){
          $( "#dialog" ).dialog({
             autoOpen:false,
             width:450,
             height:300,
             modal:true
          }).dialog("open");
       })
       
       $('#okBtn').click(function(){
          $('#myid').val($('#id').val())
          $('#dialog').dialog("close");
       })
       
       $('#postBtn').click(function(){
          new daum.Postcode({
            oncomplete:function(data)
            {
               $('#post').val(data.zonecode)
               $('#addr1').val(data.address)
            }
         }).open()
       })
       
       $('#idBtn').on("click",function(){
          let id=$('#id').val();
          if(id.trim()==="")
          {
             $('#id').focus(); // ?????? $('.?????????'), $('#?????????') , $('?????????')
             //  $refs.ref??? ==> vuejs,react
             // node => ????????? ????????? (Spring)
             // app.get('../a.do',function(request,response){??????})
             return;
          }
          
          // ?????????????????? ?????? 
          /*
              axios.get(url,{params:{}}).then()
              axios.post(url,)
          */
          $.ajax({
             type:'post',
             url:'../member/idcheck.do',
             data:{"id":id},
             success:function(result)
             {
                let res=result.trim();
                if(res==='YES')
                {
                   let msg='<span style="color:blue">'+id+'???(???) ?????? ???????????????</span>';
                   $('#result').html(msg)
                   $('#okid').show()
                }
                else
                {
                   let msg='<span style="color:red">'+id+'???(???) ???????????? ??????????????????</span>';
                   $('#result').html(msg)
                }
             }
          })
          
       })
     });
  </script>
</head>
<body>

		<!-- Start Hero Section -->
			<div class="hero">
				<div class="container">
					<div class="row justify-content-between">
						<div class="col-lg-5">
							<div class="intro-excerpt">
								<h1>????????????</h1>
							</div>
						</div>
						<div class="col-lg-7">
							
						</div>
					</div>
				</div>
			</div>
		<!-- End Hero Section -->
<div class="untree_co-section">
   <div class="container">
   
    <div class="row mb-5">
		        <div class="col-md-12">
		          <div class="border p-4 rounded" role="alert" style="background-color:#F5E3CF;">
		           	 <b>?????? ????????? ???????????????? <a href="../main/main.do">Click here</a> ?????? ????????? ??? ?????????!</b>
		          </div>
		        </div>
     </div>
		      
		      
     <div class="row">
      <div class="col-md-6 mb-5 mb-md-0">
      <h2 class="h3 mb-3 text-black"><b>???????????? ??????</b></h2>
      <div class="p-3 p-lg-5 border bg-white">
      <form method="post" action="../member/join_ok.do">
   
     
       <label for="c_fname" class="text-black">ID <span class="text-danger">*</span></label>
		    <div class="input-group w-75 couponcode-wrap">
		        <input type="text" class="form-control" name="id" readonly="readonly" id="myid">
		           &nbsp;&nbsp;&nbsp;
		           <div class="input-group-append">
		              <input type=button class="btn btn-black btn-sm" value="?????????????????????" id="idcheck">
		           </div>
		    </div>
 					<!--  ???????????? ????????? -->
		            <div class="form-group row">
		              <div class="col-md-12">
		                <label for="c_companyname" class="text-black">Password</label>
		                <input type=password class="form-control" name="pwd">
		              </div>
		            </div>
				 <!-- ?????? ????????? -->		            
		            <div class="form-group row">
		              <div class="col-md-12">
		                <label for="c_name" class="text-black">Name</label>
		                <input type="text" class="form-control" name="name">
		              </div>
		            </div>
		            <br>
				<!-- ?????? ????????? -->
		            <div class="form-group row">
		              <div class="col-md-12">
		                <label for="c_address" class="text-black">?????? <span class="text-danger">*</span></label>
		                <input type=radio name="sex" value="??????" checked="checked">??????
          			  	<input type=radio name="sex" value="??????">??????
		              </div>
		            </div>
		            <br>
				<!-- ???????????? ????????? -->
		            <div class="form-group row">
		              <div class="col-md-12">
		                <label for="c_state_country" class="text-black">????????????<span class="text-danger">*</span></label>
		                <input type=date name="birthday" size=20>
		              </div>
		            </div>
					<br>
				<!-- E-mail -->
		            <div class="form-group row">
		              <div class="col-md-12">
		                <label for="c_email_address" class="text-black">Email Address <span class="text-danger">*</span></label>
		                <input type=text class="form-control" name="email">
		              </div>
		             
		            </div>
		            
		            <div class="form-group row">
		            	 <label for="c_email_address" class="text-black">???????????? <span class="text-danger">*</span></label>
		            	 <div class="input-group w-75 couponcode-wrap">
		            	 <input type=text name="post" size=10 readonly="readonly" class="form-control" id="post">
		            	 <div class="input-group-append">
            				<input type=button class="btn btn-black btn-sm" value="??????????????????" id="postBtn">
            			</div>
            			</div>
		            </div>
         			
         			 <div class="col-md-12">
		                <label for="c_phone" class="text-black">Address <span class="text-danger">*</span></label>
		                 <input type=text name="addr1" size=70 class="form-control" id="addr1">
		             </div>
      
					<div>
		            	 <div class="col-md-12">
		                <label for="c_phone" class="text-black">Detail Address <span class="text-danger">*</span></label>
		                <input type=text class="form-control" name="addr2">
		              </div>
		            </div>
		            
		              <div class="form-group row">
		              <div class="col-md-4">
		                <label for="c_fname" class="text-black">Phone number <span class="text-danger">*</span></label>
		                <input type=text class="form-control" name="tel1"  value="010" readonly="readonly">
		                -
		              </div>
		              <div class="col-md-8">
		               <label for="c_fname" class="text-black"> </label>
		                <input type=text class="form-control" name="tel2">
		              </div>
		            </div>
		            
		            <div class="form-group">
		              <label for="c_order_notes" class="text-black">????????????</label>
		              <textarea  name="content" cols="30" rows="5" class="form-control" placeholder="Write your notes here..."></textarea>
		            </div>
		            <br><br>
		            <div class="text-center">
			        <tr>
			          <td colspan="2" class="text-center">
			            <input type=submit value="????????????" class="btn btn-sm btn-primary">
			            <input type=button value="??????" class="btn btn-sm btn-primary"
			              onclick="javascript:history.back()"
			            >
			          </td>
			        </tr>
			        </div>
     			 </form>
    </div>
    <div id="dialog" title="????????? ????????????" style="display:none">
   <table class="table">
      <tr>
         <td>
            ?????????:<input type=text name="id" size=15 class="input-sm" id="id">
                <input type=button class="btn btn-sm btn-success" id="idBtn" value="???????????????">
         </td>
      </tr>
      <tr>
         <td class="text-center" id="result"></td>
      </tr>
      <tr id="okid">
         <td class="text-center">
            <input type=button class="btn btn-sm btn-info" id="okBtn" value="??????">
         </td>
      </tr>
   </table>
    </div>
  </div>
    <div class="col-md-6">

		          <div class="row mb-5">
		            <div class="col-md-12">
		              <h2 class="h3 mb-3 text-black"><b>????????? ??????</b></h2>
		              <div class="p-3 p-lg-5 border bg-white">

		                <label for="c_code" class="text-black mb-3">????????? ???????????? ???????????????!</label>
		                <div class="input-group w-75 couponcode-wrap">
		                  <input type="text" class="form-control me-2" id="c_code" placeholder="recommender ID" aria-label="Coupon Code" aria-describedby="button-addon2">
		                </div>

		              </div>
		            </div>
		          </div>

		          <div class="row mb-5">
		            <div class="col-md-12">
		              <h2 class="h3 mb-3 text-black"><b>????????? ????????? ???????????????</b>????</h2>
		              <div class="p-3 p-lg-5 border bg-white">
		                <div class="form-group">
				              <label for="c_country" class="text-black">???????????? ????????????????</label>
				              <select id="c_country" class="form-control">
				                <option value="1">Select one</option>    
				                <option value="2">??????</option>    
				                <option value="3">??????</option>    
				                <option value="4">Afghanistan</option>    
				                <option value="5">Ghana</option>    
				                <option value="6">Albania</option>    
				                <option value="7">Bahrain</option>    
				                <option value="8">Colombia</option>    
				                <option value="9">Dominican Republic</option>    
				              </select>
				        </div>
				            
				         <br>
				          <div class="form-group">
			              <label for="c_country" class="text-black">?????? ????????? ???????????????!</label>
			              <select id="c_country" class="form-control">
			                <option value="1">Select one</option>    
			                <option value="2">??????</option>    
			                <option value="3">?????????</option>    
			                <option value="4">????????????</option>    
			                <option value="5">Ghana</option>    
			                <option value="6">Albania</option>    
			                <option value="7">Bahrain</option>    
			                <option value="8">Colombia</option>    
			                <option value="9">Dominican Republic</option>    
			              </select>
			            </div>
			            
			             <br>
				          <div class="form-group">
			              <label for="c_country" class="text-black">?????????????????? ?????? ????????? ??????????</label>
			              <select id="c_country" class="form-control">
			                <option value="1">Select one</option>    
			                <option value="2">??????</option>    
			                <option value="3">?????????</option>    
			                <option value="4">????????????</option>    
			                <option value="5">Ghana</option>    
			                <option value="6">Albania</option>    
			                <option value="7">Bahrain</option>    
			                <option value="8">Colombia</option>    
			                <option value="9">Dominican Republic</option>    
			              </select>
			            </div>
			            <br>
			             <div class="form-group">
			              <label for="c_order_notes" class="text-black">????????? ????????? ???????????? ????????? ?????????!(?????????, ????????????..)</label>
			              <textarea name="c_order_notes" id="c_order_notes" cols="30" rows="5" class="form-control" placeholder="Write your notes here..."></textarea>
			            </div>
			           
			          </div>
		              </div>
		            </div>
		          </div>

		        </div>
		      </div>
		      <!-- </form> -->
		    </div>
  </div>
  </div>
  </div>
</body>
</html>
