function valueToText(str,value){
	str=str.substring(1,str.length-1);
	/* alert(str); */
	var array=str.split(",");
	for(var i=0;i<array.length;i++){
		/* alert(array[i]); */
		var array2=array[i].split("=");
		/* alert("array2[0]:"+array2[0]);
		alert("array2[1]:"+array2[1]);
		alert("value"+value); */
		if($.trim(array2[0])==value){
			return array2[1];
		}
	}
}