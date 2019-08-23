using Autofac;
using System;
using System.Collections.Generic;

namespace Vertex.Core.Infrastructure
{
    public class Engine
    {
        private static IContainer _container;

        public static void SetContainer(IContainer container)
        {
            _container = container;
        }

        public static T Resolve<T>() where T : class
        {
            return Scope.Resolve<T>();
        }

        public static T Resolve<T>(Type type) where T : class
        {
            return (T)Scope.Resolve(type);
        }

        public static object Resolve(Type type)
        {
            return Scope.Resolve(type);
        }

        public static T ResolveUnRegistered<T>() where T : class
        {
            return ResolveUnRegistered(typeof(T)) as T;
        }

        public static T ResolveUnRegistered<T>(Type type) where T : class
        {
            return ResolveUnRegistered(type) as T;
        }

        public static object ResolveUnRegistered(Type type)
        {
            var constructors = type.GetConstructors();
            foreach (var constructor in constructors)
            {
                try
                {
                    var parameters = constructor.GetParameters();
                    var parameterInstances = new List<object>();
                    foreach (var parameter in parameters)
                    {
                        var service = Resolve(parameter.ParameterType);
                        if (service == null) throw new Exception("Unknown dependency");
                        parameterInstances.Add(service);
                    }
                    return Activator.CreateInstance(type, parameterInstances.ToArray());
                }
                catch (Exception)
                {
                    throw;
                }
            }

            throw new Exception("No constructor  was found that had all the dependencies satisfied.");
        }

        private static ILifetimeScope Scope
        {
            get
            {
                if (_container != null)
                    return _container.BeginLifetimeScope();

                throw new ArgumentNullException(nameof(_container));
            }
        }
    }
}
