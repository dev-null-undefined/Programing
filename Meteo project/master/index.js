var newWindow=null;
function onLoad()
{   

    if (confirm("Do you want to see not working devices?")) {
         if(newWindow==null){
    newWindow=window.open("window.php", "_blank");
    }else if(newWindow.closed){
    newWindow=window.open("window.php", "_blank");
    }
} else {
    console.log("Cancel");
    
}
   
}

onLoad();