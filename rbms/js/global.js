function trimLR(str) {	//去掉str左右两边空格
	var whitespace = ' \n\r\t\f\x0b\xa0\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u200b\u2028\u2029\u3000';
	for (var i = 0; i < str.length; i++) {
		if (whitespace.indexOf(str.charAt(i)) === -1) {
			str = str.substring(i);
			break;
		}
	}
	for (i = str.length - 1; i >= 0; i--) {
		if (whitespace.indexOf(str.charAt(i)) === -1) {
			str = str.substring(0, i + 1);
			break;
		}
	}
	return whitespace.indexOf(str.charAt(0)) === -1 ? str : '';
}
function showTable(obj){	
	var center=document.getElementById("center");
	var focus=document.getElementById("focus");
	focus.innerHTML = "<span>"+obj.name+"表："+"</span>";
	var xmlHttp;						
	if(window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if(window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}					
	url="showTable.php?table="+obj.name;									
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){							
			center.innerHTML = xmlHttp.responseText;

			document.getElementsByName("employees")[0].style.background="rgb(244,244,244)";
			document.getElementsByName("customers")[0].style.background="rgb(244,244,244)";
			document.getElementsByName("products")[0].style.background="rgb(244,244,244)";
			document.getElementsByName("suppliers")[0].style.background="rgb(244,244,244)";
			document.getElementsByName("purchases")[0].style.background="rgb(244,244,244)";
			document.getElementsByName("logs")[0].style.background="rgb(244,244,244)";
			document.getElementsByName(obj.name)[0].style.background="rgb(231,231,231)";
		}
	}									
	xmlHttp.send(null);		
}
function EnterPress(e){ //传入 event   
    var e = e || window.event;   
    if(e.keyCode == 13){   
    document.getElementById("button_press").click();   
    }   
}  
function submit(){
	var input_pid=document.getElementById("input_pid");  	
    if(trimLR(input_pid.value)==""){
       input_pid.focus();//聚焦
       return;
   }
   report_monthly_sale();
}	
function report_monthly_sale(){	
	var input_pid=document.getElementById("input_pid");
	var center=document.getElementById("center");
	var focus=document.getElementById("focus");
	focus.innerHTML = "<span>pid为"+input_pid.value+"的商品月度销售数据如下："+"</span>";
	var xmlHttp;						
	if(window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if(window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}					
	url="reportMonthlySale.php?pid="+input_pid.value;									
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){							
			center.innerHTML = xmlHttp.responseText;
			input_pid.value="";
		}
	}									
	xmlHttp.send(null);		
}
function addPurchase(obj){	
	var pur_pur=document.getElementById("pur_pur");
	var pur_cid=document.getElementById("pur_cid");
	var pur_eid=document.getElementById("pur_eid");
	var pur_pid=document.getElementById("pur_pid");
	var pur_qty=document.getElementById("pur_qty");
	var last_tr=document.getElementById("last_tr");
	var focus=document.getElementById("focus");
	if(trimLR(pur_pur.value)==""){
       pur_pur.focus();//聚焦
       return;
    }
    else if(trimLR(pur_cid.value)==""){
       pur_cid.focus();//聚焦
       return;
    }
    else if(trimLR(pur_eid.value)==""){
       pur_eid.focus();//聚焦
       return;
    }
    else if(trimLR(pur_pid.value)==""){
       pur_pid.focus();//聚焦
       return;
    }
    else if(trimLR(pur_qty.value)==""){
       pur_qty.focus();//聚焦
       return;
    }
	focus.innerHTML = "<span>"+obj.name+"表：添加pur为"+pur_pur.value+"的记录</span>";
	var xmlHttp;						
	if(window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if(window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}					
	url="addPurchase.php?pur="+pur_pur.value+"&cid="+pur_cid.value+"&eid="+pur_eid.value+"&pid="+pur_pid.value+"&qty="+pur_qty.value;									
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){							
			//center.innerHTML = xmlHttp.responseText;
			removeErrorMessage();
			removeqohMessage();
			var new_tr=document.createElement("tr");
			new_tr.setAttribute("align", "center");
			new_tr.innerHTML = xmlHttp.responseText;
			last_tr.parentNode.insertBefore(new_tr,last_tr);

			pur_pur.value="";
			pur_cid.value="";
			pur_eid.value="";
			pur_pid.value="";
			pur_qty.value="";
			location.hash="last_tr";
		}
	}									
	xmlHttp.send(null);		
}
function addProduct(obj){	
	var prod_pid=document.getElementById("prod_pid");
	var prod_pname=document.getElementById("prod_pname");
	var prod_qoh=document.getElementById("prod_qoh");
	var prod_qoh_threshold=document.getElementById("prod_qoh_threshold");
	var prod_original_price=document.getElementById("prod_original_price");
	var prod_discnt_rate=document.getElementById("prod_discnt_rate");
	var prod_sid=document.getElementById("prod_sid");
	var last_tr=document.getElementById("last_tr");
	var focus=document.getElementById("focus");
	if(trimLR(prod_pid.value)==""){
       prod_pid.focus();//聚焦
       return;
    }
    else if(trimLR(prod_pname.value)==""){
       prod_pname.focus();//聚焦
       return;
    }
    else if(trimLR(prod_qoh.value)==""){
       prod_qoh.focus();//聚焦
       return;
    }
    else if(trimLR(prod_qoh_threshold.value)==""){
       prod_qoh_threshold.focus();//聚焦
       return;
    }
    else if(trimLR(prod_original_price.value)==""){
       prod_original_price.focus();//聚焦
       return;
    }
    else if(trimLR(prod_discnt_rate.value)==""){
       prod_discnt_rate.focus();//聚焦
       return;
    }
    else if(trimLR(prod_sid.value)==""){
       prod_sid.focus();//聚焦
       return;
    }
	focus.innerHTML = "<span>"+obj.name+"表：添加pid为"+prod_pid.value+"的记录</span>";
	var xmlHttp;						
	if(window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if(window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}					
	url="addProduct.php?pid="+prod_pid.value+"&pname="+prod_pname.value
		+"&qoh="+prod_qoh.value+"&qoh_threshold="+prod_qoh_threshold.value
		+"&original_price="+prod_original_price.value+"&discnt_rate="+prod_discnt_rate.value+"&sid="+prod_sid.value;									
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){							
			//center.innerHTML = xmlHttp.responseText;
			removeErrorMessage();
			var new_tr=document.createElement("tr");
			new_tr.setAttribute("align", "center");
			new_tr.innerHTML = xmlHttp.responseText;
			last_tr.parentNode.insertBefore(new_tr,last_tr);

			prod_pid.value="";
			prod_pname.value="";
			prod_qoh.value="";
			prod_qoh_threshold.value="";
			prod_original_price.value="";
			prod_discnt_rate.value="";
			prod_sid.value="";
			location.hash="last_tr";
		}
	}									
	xmlHttp.send(null);		
}
function showProduct(obj){	
	var center=document.getElementById("center");
	var focus=document.getElementById("focus");
	focus.innerHTML = "<span>商品详情：</span>";
	var xmlHttp;						
	if(window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if(window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}					
	url="showProduct.php?pid="+obj.name;									
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){							
			center.innerHTML = xmlHttp.responseText;
		}
	}									
	xmlHttp.send(null);		
}
function defaultSales(){	
	var center=document.getElementById("center");
	var focus=document.getElementById("focus");
	var xmlHttp;						
	if(window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if(window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}					
	url="defaultSales.php";									
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){							
			center.innerHTML = xmlHttp.responseText;

			var rate=document.getElementsByName("rate");
			rate[0].style.background="rgb(231,231,231)";
			rate[1].style.background="rgb(256,256,256)";
			rate[2].style.background="rgb(256,256,256)";
		}
	}									
	xmlHttp.send(null);		
}
function mostSales(){	
	var center=document.getElementById("center");
	var focus=document.getElementById("focus");
	var xmlHttp;						
	if(window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if(window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}					
	url="mostSales.php";									
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){							
			center.innerHTML = xmlHttp.responseText;

			var rate=document.getElementsByName("rate");
			rate[0].style.background="rgb(256,256,256)";
			rate[1].style.background="rgb(231,231,231)";
			rate[2].style.background="rgb(256,256,256)";
		}
	}									
	xmlHttp.send(null);		
}
function newestSales(){	
	var center=document.getElementById("center");
	var focus=document.getElementById("focus");
	var xmlHttp;						
	if(window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if(window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}					
	url="newestSales.php";									
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){							
			center.innerHTML = xmlHttp.responseText;

			var rate=document.getElementsByName("rate");
			rate[0].style.background="rgb(256,256,256)";
			rate[1].style.background="rgb(256,256,256)";
			rate[2].style.background="rgb(231,231,231)";

		}
	}									
	xmlHttp.send(null);		
}
function addLoadEvent(func) {
	var oldonload = window.onload;
	if (typeof window.onload != 'function') {
		window.onload = func;
	} 
	else {
		window.onload = function() {
			oldonload();
			func();
		}
	}
}
addLoadEvent(defaultSales);

function addSupplier(obj){	
	var sid=document.getElementById("supp_sid");
	var sname=document.getElementById("supp_sname");
	var city=document.getElementById("supp_city");
	var phone=document.getElementById("supp_phone");
	var last_tr=document.getElementById("last_tr");
	var focus=document.getElementById("focus");
	if(trimLR(sid.value)==""){
       sid.focus();//聚焦
       return;
    }
    else if(trimLR(sname.value)==""){
       sname.focus();//聚焦
       return;
    }
    else if(trimLR(city.value)==""){
       city.focus();//聚焦
       return;
    }
    else if(trimLR(phone.value)==""){
       phone.focus();//聚焦
       return;
    }
	focus.innerHTML = "<span>"+obj.name+"表：添加sid为"+sid.value+"的记录</span>";
	var xmlHttp;						
	if(window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if(window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}					
	url="addSupplier.php?sid="+sid.value+"&sname="+sname.value+"&city="+city.value+"&phone="+phone.value;									
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){							
			//center.innerHTML = xmlHttp.responseText;
			removeErrorMessage();
			var new_tr=document.createElement("tr");
			new_tr.setAttribute("align", "center");
			new_tr.innerHTML = xmlHttp.responseText;
			last_tr.parentNode.insertBefore(new_tr,last_tr);

			sid.value="";
			sname.value="";
			city.value="";
			phone.value="";
			location.hash="last_tr";
		}
	}									
	xmlHttp.send(null);		
}
function addEmployee(obj){	
	var eid=document.getElementById("emp_eid");
	var ename=document.getElementById("emp_ename");
	var city=document.getElementById("emp_city");
	var last_tr=document.getElementById("last_tr");
	var focus=document.getElementById("focus");
	if(trimLR(eid.value)==""){
       eid.focus();//聚焦
       return;
    }
    else if(trimLR(ename.value)==""){
       ename.focus();//聚焦
       return;
    }
    else if(trimLR(city.value)==""){
       city.focus();//聚焦
       return;
    }
	focus.innerHTML = "<span>"+obj.name+"表：添加eid为"+eid.value+"的记录</span>";
	var xmlHttp;						
	if(window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if(window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}					
	url="addEmployee.php?eid="+eid.value+"&ename="+ename.value+"&city="+city.value;									
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){							
			//center.innerHTML = xmlHttp.responseText;
			removeErrorMessage();
			var new_tr=document.createElement("tr");
			new_tr.setAttribute("align", "center");
			new_tr.innerHTML = xmlHttp.responseText;
			last_tr.parentNode.insertBefore(new_tr,last_tr);

			eid.value="";
			ename.value="";
			city.value="";
			location.hash="last_tr";
		}
	}									
	xmlHttp.send(null);		
}
function addCustomer(obj){	
	var cid=document.getElementById("cust_cid");
	var cname=document.getElementById("cust_cname");
	var city=document.getElementById("cust_city");
	var last_tr=document.getElementById("last_tr");
	var focus=document.getElementById("focus");
	if(trimLR(cid.value)==""){
       cid.focus();//聚焦
       return;
    }
    else if(trimLR(cname.value)==""){
       cname.focus();//聚焦
       return;
    }
    else if(trimLR(city.value)==""){
       city.focus();//聚焦
       return;
    }
	focus.innerHTML = "<span>"+obj.name+"表：添加cid为"+cid.value+"的记录</span>";
	var xmlHttp;						
	if(window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	else if(window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}					
	url="addCustomer.php?cid="+cid.value+"&cname="+cname.value+"&city="+city.value;									
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState == 4 && xmlHttp.status == 200){							
			//center.innerHTML = xmlHttp.responseText;\
			removeErrorMessage();
			var new_tr=document.createElement("tr");
			new_tr.setAttribute("align", "center");
			new_tr.innerHTML = xmlHttp.responseText;
			last_tr.parentNode.insertBefore(new_tr,last_tr);

			cid.value="";
			cname.value="";
			city.value="";
			location.hash="last_tr";
		}
	}									
	xmlHttp.send(null);		
}
function removeErrorMessage(){
    $(".errorMessage").parents('tr').slideUp('slow');
}
function removeqohMessage(){
    $(".qohMessage").slideUp('slow');
}