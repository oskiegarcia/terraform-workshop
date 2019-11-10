# Exercise 4

## AWS Resources
- Launch Configuration
- Auto Scaling Group
- ELB
- IAM Role
- IAM Instance Profile
- EC2 with user data

## How Auto scaling group works 
https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html

![asg](as-basic-diagram.png)

## Notes:
### Lifecycle Customizations
The lifecycle block and its contents are meta-arguments, available for all resource blocks regardless of type. The following lifecycle meta-arguments are supported:
- create_before_destroy (bool) - By default, when Terraform must make a change to a resource argument that cannot be updated in-place due to remote API limitations, Terraform will instead destroy the existing object and then create a new replacement object with the new configured arguments.
  
  The create_before_destroy meta-argument changes this behavior so that the new replacement object is created first, and then the prior object is destroyed only once the replacement is created.
  
- prevent_destroy (bool) - This meta-argument, when set to true, will cause Terraform to reject with an error any plan that would destroy the infrastructure object associated with the resource, as long as the argument remains present in the configuration.
  
  This can be used as a measure of safety against the accidental replacement of objects that may be costly to reproduce, such as database instances. However, it will make certain configuration changes impossible to apply, and will prevent the use of the terraform destroy command once such objects are created, and so this option should be used sparingly.
  
  Since this argument must be present in configuration for the protection to apply, note that this setting does not prevent the remote object from being destroyed if the resource block were removed from configuration entirely: in that case, the prevent_destroy setting is removed along with it, and so Terraform will allow the destroy operation to succeed.
  
- ignore_changes (list of attribute names) - By default, Terraform detects any difference in the current settings of a real infrastructure object and plans to update the remote object to match configuration.
  
  In some rare cases, settings of a remote object are modified by processes outside of Terraform, which Terraform would then attempt to "fix" on the next run. In order to make Terraform share management responsibilities of a single object with a separate process, the ignore_changes meta-argument specifies resource attributes that Terraform should ignore when planning updates to the associated remote object.
  
  The arguments corresponding to the given attribute names are considered when planning a create operation, but are ignored when planning an update.

```hcl-terraform
resource "aws_instance" "example" {
  # ...

  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      tags,
    ]
  }
}
```      
Reference: https://www.terraform.io/docs/configuration/resources.html#lifecycle-lifecycle-customizations


