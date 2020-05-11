	var temp =1;
	function commentup(userNick,pIdx,cmtCnt){
			const comment = $(".input_txt").val();
			var cnt = Number(cmtCnt)+temp;
			
			console.log(cnt);
			$.ajax({
	            url : "/HelloMarket/item/comment_ok.jsp",
	            type : "POST",
	            cache : false,
	            dataType : "text",
	            data : "comment="+comment+"&userNick="+userNick+"&pIdx="+pIdx,
	            
	            success : function(data){
	            	
	            	$(".input_custorm").after(data)
	            	$("#commentCnt").html("<span>"+cnt+"</span>");
	            	temp ++;
	            	$(".input_txt").val('');
	            	
	            },
	            error : function(request,status,error){
	                var msg = "ERROR : " + request.status + "<br>"
	               console.log(msg);   
	               }
	
	        });
	}
	function zzimItem(pIdx,userIdx,pLike){
		
		$.ajax({
			url : "/HelloMarket/item/zzim_ok.jsp",
			type : "POST",
			cahce : false,
			dataType : "text",
			data : "pIdx="+pIdx+"&userIdx="+userIdx+"&pLike="+pLike,
			
			success : function(data){
				$(".wish_icon").attr("src","/HelloMarket/img/ico_zzimed.png");
				$("#likeCnt").html(data);
			},
			error : function(request,status,error){
				var msg = "ERROR : "+ request.status + "<br>"
				console.log(msg);
			}
		});
	}
	function zzimedItem(pIdx,userIdx,pLike){
		$.ajax({
			url : "/HelloMarket/item/zzimed_ok.jsp",
			type : "POST",
			cahce : false,
			dataType : "text",
			data : "pIdx="+pIdx+"&userIdx="+userIdx+"&pLike="+pLike,
			
			success : function(data){
				$(".wish_icon").attr("src","/HelloMarket/img/ico_zzim.png");
				$("#likeCnt").html(data);
			},
			error : function(request,status,error){
				var msg = "ERROR : "+ request.status + "<br>"
				console.log(msg);
			}
		});
	}
	
	function answer_answer(){
		if($(this).css("display",'none')){

			$(".answer_area").css("display",'block');
		}else if($(this).css("display",'block')){
			$(".answer_area").css("display",'none')
		}
		}
	function gotoChat(toId){
		location.href ="/HelloMarket/chat.jsp?toId="+toId;
	}
	
	


