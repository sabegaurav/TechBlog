function doLike(pid,uid) {
    
    
//    passing data to servlet in object 
    const d={
        pid: pid,
        uid: uid,
        opration :"like",
        
    };
    
    $.ajax({
        url: "Like_Servlet",
        data:d,
        success: function (data, textStatus, jqXHR) {
           
            if(data.trim()=="true") {
            let c=$(".like-counter").html();  
            c++;
            $(".like-counter").html(c);  
        }
        },
        error: function (jqXHR, textStatus, errorThrown) { 
            
            console.log(data);
        },
        processData: false,
        contentType: false
        
    })
}


