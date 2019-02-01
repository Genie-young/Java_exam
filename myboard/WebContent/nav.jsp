<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
header {
  position: fixed;
  right: 0; 
  width: 20%;
  padding: 20px;
  box-sizing: border-box;
  background: #DD3543;
}
 
nav {
  display: flex;
  align-items: flex-end;
  justify-content: space-between;
  transition: align-items .2s;
}
 
.logo {
  font-size: 2rem;
  padding: 20px 30px;
  margin: 50px 0 0 50px;
  transition: all .2s;
}
 
ul {
  margin: 50px 50px 0 0;
  padding: 0;
  transition: margin .2s;
}
 
li:not(:last-child) {
  margin-right: 20px;
}
 
li a {
  padding: 10px 20px;
}
 
.toggle-menu {
  display: none;
  font-size: 2rem;
  color: #fff;
  margin: 10px 10px 0 0;
  transition: margin .2s;
}
 
main {
  display: block;
  padding: 0 20px;
}
</style>
</head>
<body>

<header>
  <nav>
    <h1>
      <a href="" class="logo">Logo</a>
    </h1>
    <ul>
      <li>
        <a href="">About</a>
      </li>
      <li>
        <a href="">Services</a>
      </li>
      <li>
        <a href="">Portfolio</a>
      </li>
      <li>
        <a href="">Contact</a>
      </li> <li>
        <a href="">About</a>
      </li>
      <li>
        <a href="">Services</a>
      </li>
      <li>
        <a href="">Portfolio</a>
      </li>
      <li>
        <a href="">Contact</a>
      </li>
    </ul>
    <button class="toggle-menu" aria-label="Responsive Navigation Menu">☰</button>
  </nav>
</header>
    <br>
 
<main>
  <!-- content here -->
</main>
</body>
</html>