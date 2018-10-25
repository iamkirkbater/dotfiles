export AWS_PROFILE=pmcomadmin
 
function aws_login() {
  saml2aws login -a $AWS_PROFILE -p $AWS_PROFILE
}
