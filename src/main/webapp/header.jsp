<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header>
	<style type="text/css">
	    body { margin: 0; }
	    nav {
	        background: #333333;
	        padding: 15px 25%;
	    }
	    ul {
	        list-style: none;
	        display: flex;
	        justify-content: center;
	        gap: 50px;
	    }
	    .nav-a {
	        color: white;
	        font-size: 15px;
	        font-weight: 500;
	        text-decoration: none;
	    }
	</style>
	<nav>
	    <ul>
	        <li><a class="nav-a" href="index.jsp">Accueil</a></li>
	        <li><a class="nav-a" href="ServletVoiture">Voitures</a></li>
	        <li><a class="nav-a" href="ServletClient">Clients</a></li>
	        <li><a class="nav-a" href="ServletContrat">Contrats</a></li>
	        <li><a class="nav-a" href="#">Contact</a></li>
	    </ul>
	</nav>
</header>