function KiemTra()
{
	var ht = document.getElementById("txtHoTen").value;
	var email = document.getElementById("txtEmail").value;
	var aCong= email.indexOf("@");
	var dauCham = email.lastIndexOf(".");
	var nam = window.document.dangky.txtNam.value;
	var ten = window.document.dangky.txtTenDN.value;
	var mk = window.document.dangky.txtMatKhau.value;
	var nmk = window.document.dangky.txtNhapLaiMK.value;
	if(ht.length==0)
	{
		window.alert("You have not entered your name ");
		window.document.dangky.txtHoTen.focus();
		return false;
	}
	if (email.length==0) {
	alert("Email cannot be blank");
	return false;
	}
	else if ((aCong<1) || (dauCham<aCong+2) || (dauCham+2>email.length)) {
	alert("The email you entered is incorrect");
	return false;
	}

	if(nam.length==0)
	{
		window.alert("You have not entered the year of birth");
		window.document.dangky.txtNam.focus();
		return false;
	}
	else if(isNaN(nam)==true){
		window.alert("Year of birth must be a number");
		window.document.dangky.txtHoTen.focus();
		return false;
	}
	
	if(ten.length==0)
	{
		window.alert(" You have not signed up yet ");
		window.document.dangky.txtHoTen.focus();
		return false;
	}
	if (mk.length==0)
		{
		window.alert("Password can not be blank");
		document.dangky.txtMatKhau.focus();
		return false;
		}

	 if (mk.length < 5)
		{
		window.alert("Password is too short");
		document.dangky.txtMatKhau.focus();
		return false;
		}
	if(nmk.length==0)
		{
		window.alert("Confirmation password cannot be blank!");
		document.dangky.txtNhapLaiMK.focus();
		return false;
		}
		
	else if (mk!=nmk)
		{
		window.alert("Confirmation password is incorrect");
		document.dangky.txtNhapLaiMK.focus();
		return false;
		}
	if (mk=nmk)
	window.alert("SUCCESSFUL REGISTRATION");
	
}