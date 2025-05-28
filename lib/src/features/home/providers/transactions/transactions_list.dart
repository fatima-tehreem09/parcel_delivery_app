import 'package:flutter_riverpod/flutter_riverpod.dart';

final transaction = Provider(
  (ref) => transactionData,
);

final List<dynamic> transactionData = [
  {
    "name": "Alice Johnson",
    "status": "Ingoing Transfer",
    "amount": "\$2,500",
    "date": "May 28, 2025",
    "imageUrl": "https://randomuser.me/api/portraits/women/44.jpg"
  },
  {
    "name": "Netflix",
    "status": "Outgoing Transfer",
    "amount": "\$15.99",
    "date": "May 27, 2025",
    "imageUrl": "https://cdn-icons-png.flaticon.com/512/732/732228.png"
  },
  {
    "name": "John Smith",
    "status": "Ingoing Transfer",
    "amount": "\$1,200",
    "date": "May 26, 2025",
    "imageUrl": "https://randomuser.me/api/portraits/men/35.jpg"
  },
  {
    "name": "Apple Store",
    "status": "Outgoing Transfer",
    "amount": "\$349.99",
    "date": "May 25, 2025",
    "imageUrl": "https://cdn-icons-png.flaticon.com/512/732/732229.png"
  },
  {
    "name": "Mary Chen",
    "status": "Ingoing Transfer",
    "amount": "\$540",
    "date": "May 24, 2025",
    "imageUrl": "https://randomuser.me/api/portraits/women/68.jpg"
  },
  {
    "name": "Spotify",
    "status": "Outgoing Transfer",
    "amount": "\$9.99",
    "date": "May 23, 2025",
    "imageUrl": "https://cdn-icons-png.flaticon.com/512/5968/5968892.png"
  },
  {
    "name": "James Lee",
    "status": "Ingoing Transfer",
    "amount": "\$750",
    "date": "May 22, 2025",
    "imageUrl": "https://randomuser.me/api/portraits/men/45.jpg"
  },
  {
    "name": "Uber",
    "status": "Outgoing Transfer",
    "amount": "\$23.45",
    "date": "May 21, 2025",
    "imageUrl": "https://cdn-icons-png.flaticon.com/512/732/732229.png"
  },
  {
    "name": "Freelance Payment",
    "status": "Ingoing Transfer",
    "amount": "\$1,050",
    "date": "May 20, 2025",
    "imageUrl": "https://cdn-icons-png.flaticon.com/512/190/190411.png"
  },
  {
    "name": "Amazon",
    "status": "Outgoing Transfer",
    "amount": "\$189.00",
    "date": "May 19, 2025",
    "imageUrl": "https://cdn-icons-png.flaticon.com/512/5968/5968927.png"
  },
  {
    "name": "Sarah Lee",
    "status": "Ingoing Transfer",
    "amount": "\$430",
    "date": "May 18, 2025",
    "imageUrl": "https://randomuser.me/api/portraits/women/56.jpg"
  },
  {
    "name": "Google Cloud",
    "status": "Outgoing Transfer",
    "amount": "\$49.99",
    "date": "May 17, 2025",
    "imageUrl": "https://cdn-icons-png.flaticon.com/512/270/270798.png"
  },
  {
    "name": "Jack Black",
    "status": "Ingoing Transfer",
    "amount": "\$890",
    "date": "May 16, 2025",
    "imageUrl": "https://randomuser.me/api/portraits/men/23.jpg"
  },
  {
    "name": "Steam",
    "status": "Outgoing Transfer",
    "amount": "\$29.99",
    "date": "May 15, 2025",
    "imageUrl": "https://cdn-icons-png.flaticon.com/512/732/732223.png"
  },
  {
    "name": "Grace Kim",
    "status": "Ingoing Transfer",
    "amount": "\$620",
    "date": "May 14, 2025",
    "imageUrl": "https://randomuser.me/api/portraits/women/77.jpg"
  },
];
