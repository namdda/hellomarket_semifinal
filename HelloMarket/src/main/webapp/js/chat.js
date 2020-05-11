function sendMsg(fromNick,toNick){
	const chatContent = $(".chat_input").text();
	
	$.ajax({
		url : "/HelloMarket/chat_ok.jsp",
		type : "POST",
		cache : false,
		dataType : "text",
		data : "fromNick="+fromNick+"&toNick="+toNick+"&cContent="+chatContent,
		
		success : function(data){
			$(".chat_description").html(data);
			$(".chat_description").scrollTop($(".chat_description")[0].scrollHeight);
			$(".chat_input").text("");
		}
	})
}

function chatReload(fromNick,toNick){
	$.ajax({
		url : "/HelloMarket/chat_load.jsp",
		type : "POST",
		cache : false,
		dataType : "text",
		data : "fromNick="+fromNick+"&toNick="+toNick,
		
		success : function(data){
			$(".chat_description").html(data);
			$(".chat_description").scrollTop($(".chat_description")[0].scrollHeight);
		}
	})
}

function chatInfReload(fromNick,toNick){
	setInterval(function(){
		chatReload(fromNick,toNick);
	},2000)
}



$(document).ready(function (){
	$(".chat_description").scrollTop($(".chat_description")[0].scrollHeight);
})