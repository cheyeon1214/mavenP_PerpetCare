<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style>
	
	#logo {
		height: 70px;
	}
	#header {
		position: fixed;
		top: 0;
		/* width: 100% */
		left: 0;
		right: 0;
		z-index: 101;
		background-color: #64DAFE;
		display:flex;
		width: 100%;
		height: 100px;
		justify-content: space-between;
		align-items: center;
		padding: 10px 0;
		box-shadow: 2px 2px 5px rgba(59, 59, 59, 0.5);
	}
	.header-left{
		margin-left:100px;
	}
	.header-right {
		margin-right: 100px;
	}
	#profile-link{
		cursor: pointer;
	}
    #profile{
        border-radius: 50%;
        height: 70px;
        box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 3px 3px rgba(0,0,0,0.23);
    }
</style>
</head>
<body>
<header id="header">
	<div class="header-left">
		<a href='home.html'> 
            <!-- 홈 경로 설정 해야함 -->
			<img alt="" src="${pageContext.request.contextPath}/image/logo.png" id="logo" />
		</a>
	</div>
	<div class="header-right">
        <a href="#" id="profile-link">
            <!-- profile 경로 설정 해야함 -->
            <img alt="" src="${pageContext.request.contextPath}/image/profile_1.svg" id="profile" />
        </a>
	</div>
</header>
</body>
</html>