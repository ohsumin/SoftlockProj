<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserLoginForm.jsp</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/litera/bootstrap.min.css">
<style>
#txt{
   text-align:left;
   font-size:0.8em;
}
</style>
</head>
<body style="background-color:#F5F6F9">
<!-- Navigation -->
<jsp:include page="/resources/common/navHp.jsp"/>
<div class="container"><br /><br /><br /><br />
   <div style="width:1000px; height:auto; background-color:white; float:none; margin:0 auto;">
      <form action="../hospital/modifyAction" style="float:none; margin:0 auto; text-align:center; width:760px;">
      <br /><br /><br />
      <div class="logo">
         <h4>병원 상세정보기입</h4>   
      </div><br /><br /><br />
        <div id="txt">&nbsp;병원전화번호</div>
        <input type="text" class="form-control" id="hp_phone" name="hp_phone"><br />
      <div id="txt">&nbsp;병원 OPEN/CLOSE 시간</div>
      <table class="table" style="float:none; margin:0 auto; text-align:center; border-bottom:1px solid #D8D8D8;">
         <tr class="table" style="text-align: center; background-color:#2E9AFE; color:white; font-size:1.1em;">
            <td style="font-weight:bold;">월</td>
            <td style="font-weight:bold;">화</td>
            <td style="font-weight:bold;">수</td>
            <td style="font-weight:bold;">목</td>
            <td style="font-weight:bold;">금</td>
            <td style="font-weight:bold;">토</td>
            <td style="font-weight:bold;">일</td>
         </tr>
         <tr style="text-align: center;">
            <%
            String[] dyopen = {"mon_open", "tue_open", "wed_open", "thu_open", "fri_open", "sat_open", "sun_open"};
            
            String[] dyclose = {"mon_close", "tue_close", "wed_close", "thu_close", "fri_close", "sat_close", "sun_close"};
            
            for(int a=0; a<dyopen.length; a++){
            %>
            <td>
               <select class="ui search dropdown" id="<%=dyopen[a] %>" name="<%=dyopen[a] %>">
                 <option value="">오픈시간</option>
                  <%
                  // 요일 배열
                    String time = "";
                  for(int i=9; i<=24; i++) {
                     for(int j=0; j<=1; j++) {
                        String hour = String.valueOf(i);
                        if(i == 9) 
                           hour = "09";
                        if(j == 0) 
                           time = hour + ":00";
                        else if(j == 1) 
                           time = hour + ":30";   
                        %>
                        <option value="<%=time%>"><%=time%></option>
                        <%
                        if(i == 24) 
                           break;
                     }
                  }
                   %>
               </select>
               <select class="ui search dropdown" id="<%=dyclose[a] %>" name="<%=dyclose[a]%>">
                 <option value="">마감시간</option>
                  <%
                  for(int i=9; i<=24; i++) {
                     for(int j=0; j<=1; j++) {
                        String hour = String.valueOf(i);
                        if(i == 9) 
                           hour = "09";
                        if(j == 0) 
                           time = hour + ":00";
                        else if(j == 1) 
                           time = hour + ":30";   
                        %>
                        <option value="<%=time%>"><%=time%></option>
                        <%
                        if(i == 24) 
                           break;
                     }
                  }
                   %>  
               </select>
            </td>
            <%} %>
         </tr>
         <tr style="font-size:0.9em; text-align:left;">
            <td colspan="7">
               <input type="checkbox" value="nightTreatYes" />&nbsp;야간진료여부
               <input type="checkbox" value="sunTreatYes" style="margin-left:30px;"/>&nbsp;일요일진료여부
            </td>
         </tr>
      </table><br />
         
      <div id="txt">&nbsp;그외 특이사항</div>
       <input type="text" class="form-control" id="hp_etc" name="hp_etc" 
          style="font-size:0.8em;" placeholder="Ex)예약전 미리연락, 공지사항, 휴무여부 등"><br />
       
      
      <div id="txt">&nbsp;병원소개</div>
         <textarea class="form-control" id="hp_detailInfo" name="hp_detailInfo" rows="3"></textarea><br />
       
       <div id="txt">&nbsp;병원사진</div><br />
       <input type="file" class="form-control-file" id="hp_img" name="hp_img" style="font-size:0.8em;">
       <!--
       <div class="rounded" style="width:240px; height:200px; background-color:#F2F2F2; display:inline-block;"> </div> -->
       <br /><br />
       <button type="submit" class="btn btn-primary btn-lg btn-block">확인</button>
       <br /><br /><br />
   </form>
</div>
</div>
<br /><br /><br /><br />
<!-- bottom -->
<jsp:include page="/resources/common/footer.jsp"/>
</body>
</html>