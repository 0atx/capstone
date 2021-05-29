var diffDays;
var token;
var header;

var csrfToken = $("meta[name='_csrf']").attr("content");
$.ajaxPrefilter(function(options, originalOptions, jqXHR){
   if (options['type'].toLowerCase() === "post") {
       jqXHR.setRequestHeader('X-CSRF-TOKEN', csrfToken);  
   }
});


$(function() {
   fn_default_datepicker();

    token = $("input[name='_csrf']").val();
    header = "X-CSRF-TOKEN";
       
});

function fn_default_datepicker() {  

   var start = $( "#datepicker" ).datepicker({
       dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능              
        //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
        //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        ,minDate: "today" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+3M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)   
        ,onSelect: function(select){
              
           var startday = select;           
		   alert("여행 시작일 " + select + " 로 선택되었습니다.");
      }  
       ,onClose : function(select){
          $("#datepicker2").datepicker( "option", "minDate", select);
            
           var date = $(this).datepicker('getDate');
           date.setDate(date.getDate() + 4);
           $("#datepicker2").datepicker("option", "maxDate",  date );
      }           
   });

    var end = $( "#datepicker2" ).datepicker({
       dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        ,minDate: "today"  //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+4D"//최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
        // ,defaultDate: "+1w"
        ,onSelect:function(end){
           alert("여행종료일 " + end + " 로 선택되었습니다.");
           calday();
           $(".days").max = diffDays;
    	   $(".totalDay *").remove();
    	   var inner = "<span>총 여행일수 : " + diffDays + "</span>";
    	   $(".totalDay").append(inner);
        }
   });

   //초기값을 오늘 날짜로 설정
   $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
   $('#datepicker2').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
}

function calday(){
    start = $("#datepicker").datepicker('getDate').getTime(),
    end = $("#datepicker2").datepicker('getDate').getTime(),
    c = 24*60*60*1000,
    diffDays = Math.round(Math.abs((start-end)/(c))) + 1 ;
   
}
   
function save(){

   var email = $("#email").val();
      
    /*start = $("#datepicker").datepicker('getDate').getTime(),
    end = $("#datepicker2").datepicker('getDate').getTime(),
    c = 24*60*60*1000,
    diffDays = Math.round(Math.abs((start-end)/(c))) + 1 ;*/
         
    var a = $("#datepicker").datepicker({ dateFormat: 'yyyymmdd' }).val();
    var b = $("#datepicker2").datepicker({ dateFormat: 'yyyymmdd' }).val();
      
    alert("출발: " + a + " 도착:" + b + " 총 여행일수: " + diffDays );

	postUser(email);
	postPlan(email, a, b, diffDays);
	postSpot(email);
     
};


function showModal() {
   $("#modal").show();
}

function closeModal() {
   $("#modal").hide();
   //$(".emailhModal").hide();
}

function checkEmail() {
   
   var email = $("#email").val();
                                                    
    var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
    if(!email) {
       alert("이메일을 입력하세요.");
      $("#email").focus();
       return; 
    }
    else {
       if(!reg_email.test(email)) {                            
          alert("이메일 형식이 잘못되었습니다.");
         $("#email").focus();
          return;         
       }                            
       else {     
          save();        
          closeModal(); // 다음 페이지 만들어지면 그 넘어갈 페이지 작업으로 변경
       }     
    }                       
} 
