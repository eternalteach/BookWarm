using System.Collections.Generic;
using System.Linq;
using Vertex.Core.Entities;
using Vertex.Data;

namespace Vertex.Service
{
    public class ClientTestimonialsService : IClietTestimonialsService
    {
        private readonly IRepository<ClientTestimonials> testimonialsRepository;
        private readonly IMediaStorageService mediaStorageService;

        public ClientTestimonialsService(IRepository<ClientTestimonials> _testimonialsRepository,
            IMediaStorageService _mediaStorageService)
        {
            testimonialsRepository = _testimonialsRepository;
            mediaStorageService = _mediaStorageService;
        }

        public virtual ClientTestimonials GetById(int id)
        {
            if (id == 0)
                return null;
            var media = testimonialsRepository.Find(x => x.Id == id);
            return media;
        }

        public bool Insert(ClientTestimonials testi)
        {
            return testimonialsRepository.Insert(testi);
        }

        public bool Update(ClientTestimonials testi)
        {
            return testimonialsRepository.Update(testi);
        }

        public bool Delete(ClientTestimonials testi)
        {
            var clientLogoId = testi.ClientLogoId;
            var personPictureId = testi.PersonPictureId;

            var deleted = testimonialsRepository.Delete(testi);
            if (deleted)
            {
                mediaStorageService.Delete(clientLogoId);
                mediaStorageService.Delete(personPictureId);
            }

            return deleted;
        }

        public IEnumerable<ClientTestimonials> GetActiveTestimonials()
        {
            return (from p in testimonialsRepository.Table
                    where !string.IsNullOrEmpty(p.TypeName) &&
                          (p.TypeName == ClientTestimonialsType.OnlyTestimonials.ToString() ||
                            (p.TypeName == ClientTestimonialsType.ClientAndTestimonials.ToString() && !string.IsNullOrEmpty(p.ClientName))) &&
                          p.IsActive && !string.IsNullOrEmpty(p.WhatSayAboutUs)
                    orderby p.OrderNo ascending
                    select p).ToList();
        }

        public IEnumerable<ClientTestimonials> GetActiveClients()
        {
            return (from p in testimonialsRepository.Table
                    where p.IsActive &&
                            !string.IsNullOrEmpty(p.TypeName) && p.TypeName == ClientTestimonialsType.OnlyClient.ToString() &&
                            !string.IsNullOrEmpty(p.ClientName) &&
                            p.ClientLogoId > 0
                    orderby p.OrderNo ascending
                    select p).ToList();
        }

        public IEnumerable<ClientTestimonials> GetTestimonials()
        {
            return (from p in testimonialsRepository.Table
                    orderby p.OrderNo ascending
                    select p).ToList();
        }

        public IEnumerable<ClientTestimonials> GetClients()
        {
            return (from p in testimonialsRepository.Table
                    orderby p.OrderNo ascending
                    select p).ToList();
        }
    }
}