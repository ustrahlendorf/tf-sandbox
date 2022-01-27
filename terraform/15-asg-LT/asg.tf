data "template_file" "userdata" {
  template = "${filebase64("${path.module}/userdata.tpl")}"
}

resource "aws_launch_template" "this" {
    name                   = "${var.base_name}-LT1-tf"
    image_id               = data.aws_ami.amazon_linux_2.image_id
    instance_type          = "t3.micro"
    user_data              = data.template_file.userdata.rendered
    iam_instance_profile {
        arn = data.aws_iam_instance_profile.this.arn
    }
    vpc_security_group_ids = [
        aws_security_group.web-sg.id
    ]
}

resource "aws_autoscaling_group" "this" {
    name_prefix = "${var.base_name}-ASG-"
    launch_template {
        name = "${aws_launch_template.this.name}"
        version = "$Default"
    }
    min_size = 0
    max_size = 4
    desired_capacity = 0
    default_cooldown = 300
    health_check_type = "EC2"
    health_check_grace_period = 120
    vpc_zone_identifier = data.aws_subnet_ids.public.ids

    termination_policies = [
        "Default"
    ]
    enabled_metrics = [
        "GroupMaxSize",
        "GroupTotalInstances",
        "WarmPoolTerminatingCapacity",
        "WarmPoolWarmedCapacity",
        "WarmPoolTotalCapacity",
        "GroupAndWarmPoolTotalCapacity",
        "GroupStandbyCapacity",
        "GroupInServiceCapacity",
        "GroupAndWarmPoolDesiredCapacity",
        "GroupDesiredCapacity",
        "GroupTerminatingInstances",
        "GroupInServiceInstances",
        "GroupTotalCapacity",
        "GroupStandbyInstances",
        "GroupTerminatingCapacity",
        "GroupMinSize",
        "WarmPoolPendingCapacity",
        "WarmPoolMinSize",
        "GroupPendingCapacity",
        "WarmPoolDesiredCapacity",
        "GroupPendingInstances"
    ]
    tags = [ 
      {
        key = "Name"
        value = "${var.base_name}-Worker"
        propagate_at_launch = true
      }
    ]
   lifecycle {
     create_before_destroy = true
   }
}
