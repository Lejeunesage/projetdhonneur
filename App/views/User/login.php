<!DOCTYPE html>
<html lang="fr">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Connexion</title>

  

   <!-- custom css file link  -->
   <link rel="stylesheet" href="./ressources/css/components.css">
   <link rel="stylesheet" href="./ressources/css/footer.css">

</head>
<body>

<section class="form-container">

   <form action="/login/macth" method="POST">
      <h3>Se connecter maintenant</h3>
      <p>pour avoir une meilleur expérience! 😋</p>
      <input type="email" name="email" class="box" placeholder="Entrer votre email" required>
      <input type="password" name="pass" class="box" placeholder="Entrer votre mot de passe" required>
      <input type="submit" value="Se connecter" class="btn" name="submit">
      <p>Vous n'avez pas de compte ? <a href="/register">S'inscrire maintenant</a></p>
   </form>

</section>


</body>
</html>