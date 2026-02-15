# Step by Step guide for SSH

## Method 1: `create_key_pair = true` (The Upload Method)

To use this specific repository structure, you need to follow the "Hybrid Approach"

You need to generate the key pair on your own computer and "plug in" the public part.

### Step 1: Generate the SSH Key Pair locally

Open your terminal (on your laptop, not in AWS) and run this command. This creates a brand new key specifically for this project.

```bash
# Generate a modern, secure Ed25519 key
ssh-keygen -t ed25519 -f ./my-terraform-key -C "admin@core-app"
```
- `my-terraform-key`: This is your Private Key. Never share this.

- `my-terraform-key.pub`: This is your Public Key. This is what goes into Terraform.

### Step 2: Configure your `terraform.tfvars`

Now, go to your project folder and copy the example file as instructed by the repo:

```bash
cp environments/dev/dev.tfvars.example environments/dev/terraform.tfvars
```
Open `environments/dev/terraform.tfvars` and update these specific lines:

```Terraform
# 1. Ensure this is true so Terraform creates the resource in AWS
create_key_pair = true

# 2. Give it a name you'll recognize in the AWS Console
key_pair_name   = "core-app-dev-key"

# 3. Open 'my-terraform-key.pub' in a text editor, copy the WHOLE line,
# and paste it here inside the quotes.
public_key      = "ssh-ed25519 AAAAC3Nza...rest-of-key... admin@core-app"
```

### Step 3: Deploy
Navigate to the environment folder and run your Terraform commands:

```bash
cd environments/dev
terraform init
terraform plan   # Check that it says "1 to add" for aws_key_pair
terraform apply
```
### Step 4: How to Connect (The Private Key part)

Since EC2 instance is in a private subnet, you cannot SSH into it directly from the internet using its IP. You have two choices:

#### Option A: Use the Private Key (via Bastion or VPN)

If you have a path to the private subnet, you use the private file you generated in Step 1:

```bash
# Set strict permissions (required by SSH)
chmod 400 ./my-terraform-key

# Connect using the private key
ssh -i ./my-terraform-key ec2-user@<PRIVATE_IP>
```
#### Option B: Use AWS SSM (Recommended)

Note that your repo includes `AmazonSSMManagedInstanceCore`. It means you don't actually need the SSH key to log in. You can go to the **AWS Console > EC2 > Instances,** select your instance, and click **Connect > Session Manager**. No key required!


## Method 2: `create_key_pair = false` (The Existing Key Method)

If you already made a key in the AWS Console years ago and just want to reuse it, or if you prefer clicking buttons in the AWS Console.

### Step 1: Create Key in AWS Console

1. Go to **AWS Console > EC2 > Key Pairs**.
2. Click **Create key pair**.
3. Name it `my-console-key`.
4. Choose file format `.pem` (for Mac/Linux) or `.ppk` (for older Windows/Putty).
5. **Click Create** -> The file automatically downloads to your computer. **Do not lose this file**. You cannot download it again.

### Step 2: Update terraform.tfvars

You do not need the public key string here. You just tell Terraform the name.

Edit `environments/dev/terraform.tfvars`:

```Terraform
create_key_pair = false
key_pair_name   = "my-console-key" # Must match the name in AWS Console exactly

# You can leave this blank or dummy text, Terraform ignores it because create_key_pair is false
public_key      = ""
```

### Step 3: Deploy
Navigate to the environment folder and run your Terraform commands:

```bash
cd environments/dev
terraform init
terraform plan   # Check that it says "1 to add" for aws_key_pair
terraform apply