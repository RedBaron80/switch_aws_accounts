# switch_aws_accounts
<h2>Introduction<h1>
  <p> This is a simple set up for Mac OS</p>
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
  <li>Create ~/.aws/credentials
      Add [develop] and [production] section with your api keys, among with other aws accounts
      <pre>
        [develop]
        aws_access_key_id = xxxxx
        aws_secret_access_key = yyyy
        
        [production]
        aws_access_key_id = xxxxx
        aws_secret_access_key = zzzzz
      </pre>
  </li>
</ul>
<h2>Usage</h2>
  <pre> $ switch develop # or switch production</pre>
  <pre> $ python connect.py TAG_NAME TAG SSH_USERNAME</pre>
