import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../shared/widget/components.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class AllScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<homeCubit, homeStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = homeCubit.getInstance(context).all;

        return articleBuilder(list,context,false);
      },
    );
  }
}
class EntertainmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<homeCubit, homeStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = homeCubit.getInstance(context).entertainment;

        return articleBuilder(list,context,false);
      },
    );
  }
}
class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<homeCubit, homeStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = homeCubit.getInstance(context).business;

        return articleBuilder(list,context,false);
      },
    );
  }
}
class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<homeCubit, homeStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = homeCubit.getInstance(context).science;

        return articleBuilder(list,context,false);
      },
    );
  }
}
class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<homeCubit, homeStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = homeCubit.getInstance(context).sports;

        return articleBuilder(list,context,false);
      },
    );
  }
}
class TechnologyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<homeCubit, homeStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = homeCubit.getInstance(context).technology;

        return articleBuilder(list,context,false);
      },
    );
  }
}
class HealthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<homeCubit, homeStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = homeCubit.getInstance(context).health;

        return articleBuilder(list,context,false);
      },
    );
  }
}


