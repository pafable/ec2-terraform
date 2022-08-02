output "arn" {
  value = aws_instance.my_amzn2.*.arn
}

output "id" {
  value = aws_instance.my_amzn2.*.id
}

output "pub_dns" {
  value = aws_instance.my_amzn2.*.public_dns
}