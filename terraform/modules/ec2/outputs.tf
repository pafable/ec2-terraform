output "arn" {
  value = aws_instance.amznl2.*.arn
}

output "id" {
  value = aws_instance.amznl2.*.id
}

output "pub_dns" {
  value = aws_instance.amznl2.*.public_dns
}
