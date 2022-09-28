import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/blocs/product_bloc/product_bloc.dart';
import 'package:store_app/blocs/product_bloc/product_event.dart';
import 'package:store_app/blocs/product_bloc/product_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    loadProducts();
    super.initState();
  }

  loadProducts() async {
    context.read<ProductBloc>().add(LoadProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Products"),
        //   backgroundColor: Colors.amber[800],
        //   automaticallyImplyLeading: false,
        // ),
        body: Column(
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hi Manohar",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                ),
                CircleAvatar(
                    child: ClipOval(
                  child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSe8ma2KIUHWy3owG081-6NGNCMFbFtH6oI7A&usqp=CAU"),
                ))
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.orange[200],
                borderRadius: BorderRadius.circular(10)),
          ),
          flex: 0,
          fit: FlexFit.loose,
        ),
        Flexible(
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoadingState) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is ProductLoadedState) {
                return GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                      state.products.length,
                      (index) => ProductContainer(
                            title: state.products[index].title,
                            image: state.products[index].image,
                            price: state.products[index].price,
                            category: state.products[index].category,
                            ratings: state.products[index].ratings,
                            totalRatings: state.products[index].ratingCount,
                          )),
                );
              }
              if (state is ProductErrorState) {
                return Container(
                  child: Text(state.error.toString()),
                );
              }
              return Container();
            },

          ),
          flex: 9,
        )
      ],
    ));
  }
}
// ListView.builder(
// itemCount: state.products.length,
// itemBuilder: (BuildContext context, int index) {
// return ProductContainer(
// title: state.products[index].title,
// image: state.products[index].image,
// price: state.products[index].price);
// });

class ProductContainer extends StatefulWidget {
  const ProductContainer({
    Key? key,
    required this.title,
    required this.image,
    required this.price,
    required this.category,
    required this.ratings,
    required this.totalRatings,
  }) : super(key: key);
  final String title;
  final String image;
  final String price;
  final String category;
  final String ratings;
  final String totalRatings;
  @override
  State<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Image.network(widget.image),
                height: MediaQuery.of(context).size.width * 0.25,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
          Text(
            "${widget.title} ",
            style: TextStyle(fontSize: 12),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${widget.price}\$", style: TextStyle(fontSize: 20)),
              // Text("${widget.category}" , style: TextStyle(fontSize: 15))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("Rating ${widget.ratings}",
                      style: TextStyle(fontSize: 15)),
                  Icon(
                    Icons.star,
                    color: Colors.orangeAccent,
                    size: 20,
                  ),
                  Text("(${widget.totalRatings})",
                      style: TextStyle(fontSize: 15)),
                ],
              )
              // Text("${widget.category}" , style: TextStyle(fontSize: 15))
            ],
          ),
        ],
      ),
    );
  }
}
