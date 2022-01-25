# terraform-destroy-on-action


git action which is published on github market place

Example

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
