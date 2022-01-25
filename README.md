# terraform-destroy-on-action


git action which is published on github market place

#############################################################

**#USE Example**

    - name: Terraform destroy on github action aws v1
      env:
        GITHUB_TOKEN: ${{ secrets.TOKEN_GITHUB }}
        AWS_REGION: ${{ secrets.AWS_REGION }}
        AWS_ACCESS_KEY_ID:  ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY:  ${{ secrets.AWS_SECRET_ACCESS_KEY }}
      
      uses: md1810/terraform-destroy-on-action@v5.1
      with:
        org_name: ${{ secrets.INPUT_ORG_NAME }}
        repo_name: ${{ secrets.INPUT_REPO_NAME }}



## **Below mentioned variable should be stored in Github Secrets**

# **TOKEN_GITHUB**            = Github Token (Required)
# **AWS_REGION**              = Region (Required)
# **AWS_ACCESS_KEY_ID**       = Access key id (Required)
# **AWS_SECRET_ACCESS_KEY**   = Secret key id (Required)
# **INPUT_ORG_NAME**          = Organization/Account Username (Required)
# **INPUT_REPO_NAME**         = Repository Name (Required)
