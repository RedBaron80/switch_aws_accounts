# switch_aws_accounts

<h2>Requirements</h2>
<ul>
  <li><strong>i2cssh</strong> gem install i2cssh</li>
  <li><strong>boto3</strong> library pip install boto3 --user</li>
</ul>
<h2>Configuration</h2>
<ul>
  <li>Add the switch function to your init script. It may be .bash_profile, .bashrc or .zshrc</li>
  <li>Please make sure that the private keys exists and the path is correct. Add more if necessary</li>
  <li>Feel free to make an alias for the connect.py file</li>
</ul>
<h2>Usage</h2>
  <p> $ switch develop </p>
  <p> $ python connect.py <tagname> <tag> <ssh username> </p>
